#!/usr/bin/env bash
set -euo pipefail

# Two-phase pipeline. Prints the final HTML fragment to stdout.
# Requires: ANTHROPIC_API_KEY (loaded from repo-root .env if present).
#
#   1. DISCOVER  — broad search, returns candidate names only. Small prompt,
#                  no rubric, no ledger.
#   2. dedupe    — plain code, against the ledger. No model, no tokens.
#   3. TRIAGE    — no search tool, so no quadratic. Shortlists ~14 from ~50 on
#                  the one-line descriptions alone. Costs cents.
#   4. EVALUATE  — rubric + write-up, on the shortlist only. Fresh context.
#
# Why the splits: inside one call, N web searches cost roughly N^2 in input
# tokens, because every turn re-reads every earlier search result. Separate
# calls mean several small squares instead of one big one, and discovery's
# search noise (mostly companies that get rejected) never enters the evaluate
# context at all. Measured single-call baseline was ~600k input tokens.
#
# Triage exists because that N^2 makes evaluate's search budget the scarce
# resource. Filtering candidates down *before* evaluate is far cheaper than
# giving evaluate more searches, and it stops a long candidate list from
# starving each company of research.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

MODEL="claude-opus-4-6"
# Search budgets are the main cost dial — cost scales ~quadratically with these,
# not linearly. Raise for more coverage, lower for less spend. Triage has no
# search budget by design; widen the funnel there instead, it is nearly free.
DISCOVER_MAX_SEARCHES=12
EVALUATE_MAX_SEARCHES=12

# Auto-load repo-root .env if present (git-ignored).
ENV_FILE="$SCRIPT_DIR/../.env"
if [ -f "$ENV_FILE" ]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

: "${ANTHROPIC_API_KEY:?ANTHROPIC_API_KEY not set}"

today=$(date +%Y-%m-%d)
HISTORY_DIR="$SCRIPT_DIR/history"
LEDGER="$HISTORY_DIR/ledger.txt"
mkdir -p "$HISTORY_DIR"
touch "$LEDGER"

# $1=prompt  $2=max_searches (0 = no tools at all)  $3=effort  $4=max_tokens  $5=response file
# Writes the raw response to $5, logs a usage line to stderr, returns non-zero on HTTP error.
anthropic_call() {
  local payload http_code
  payload=$(printf '%s' "$1" | jq -Rs \
    --arg model "$MODEL" \
    --argjson max_searches "$2" \
    --arg effort "$3" \
    --argjson max_tokens "$4" \
    '{
       model: $model,
       max_tokens: $max_tokens,
       thinking: {type: "adaptive"},
       output_config: {effort: $effort},
       messages: [{role: "user", content: .}]
     }
     # No tools key at all when the budget is 0 — that is what keeps triage
     # to a single turn, and a single turn is why it has no quadratic.
     + (if $max_searches > 0
        then {tools: [{type: "web_search_20250305", name: "web_search", max_uses: $max_searches}]}
        else {} end)')

  http_code=$(printf '%s' "$payload" | curl -sS -o "$5" -w "%{http_code}" \
      https://api.anthropic.com/v1/messages \
      -H "x-api-key: $ANTHROPIC_API_KEY" \
      -H "anthropic-version: 2023-06-01" \
      -H "Content-Type: application/json" \
      -d @-)

  if [ "$http_code" -ge 400 ]; then
    echo "--- Anthropic API error ($http_code) ---" >&2
    cat "$5" >&2
    return 1
  fi

  # Per-phase spend, visible in the workflow log without downloading the artifact.
  # in x $5/M + out x $25/M + searches x $0.01 = phase cost.
  jq -r '.usage | "    input=\(.input_tokens)  output=\(.output_tokens)  thinking=\(.output_tokens_details.thinking_tokens // 0)  searches=\(.server_tool_use.web_search_requests // 0)"' "$5" >&2
}

# Joins every text block in a response file.
response_text() {
  jq -r '[.content[]? | select(.type=="text") | .text] | join("\n")' "$1"
}

# ---------------------------------------------------------------- 1. DISCOVER

echo "--- Phase 1: discover (max $DISCOVER_MAX_SEARCHES searches) ---" >&2
discover_prompt=$(sed "s/{{TODAY}}/$today/g" "$SCRIPT_DIR/discover.md")
anthropic_call "$discover_prompt" "$DISCOVER_MAX_SEARCHES" low 8000 /tmp/discover_response.json

# ------------------------------------------------------------------ 2. DEDUPE

# Ledger dedup lives here, not in the prompt. The ledger grows forever; keeping
# it out of the model means it never costs a token, and exact-match filtering is
# something code does perfectly and a model does approximately.
candidates=$(response_text /tmp/discover_response.json | python3 -c '
import re, sys

ledger = {line.strip().lower() for line in open(sys.argv[1]) if line.strip()}

# An anonymous listing is not a candidate. Its "name" is invented, so it never
# matches the ledger and the same posting resurfaces every run — and evaluate
# burns searches trying to verify a company that has no name. The prompt asks
# for named companies; this is the backstop when the model slips.
PLACEHOLDER = re.compile(r"^(stealth|unnamed|undisclosed|confidential|anonymous)\b", re.I)

seen, kept, dropped, junk = set(), [], 0, 0

for line in sys.stdin:
    m = re.match(r"^\s*CANDIDATE:\s*(.+?)\s*\|\s*([^|]+?)\s*\|\s*(.*)$", line)
    if not m:
        continue
    name = re.sub(r"\s+", " ", m.group(1)).strip()
    key = name.lower()
    if not name or key in seen:
        continue
    seen.add(key)
    if PLACEHOLDER.match(name):
        junk += 1
        continue
    if key in ledger:
        dropped += 1
        continue
    kept.append("- %s — %s — %s" % (name, m.group(2).strip(), m.group(3).strip()))

print("--- %d candidates found, %d unnamed, %d already covered, %d passed to evaluate ---"
      % (len(seen), junk, dropped, len(kept)), file=sys.stderr)
print("\n".join(kept))
' "$LEDGER")

n_candidates=$(printf '%s' "$candidates" | grep -c '^- ' || true)
if [ "$n_candidates" -eq 0 ]; then
  echo "--- No new candidates survived discovery; refusing to run evaluate ---" >&2
  response_text /tmp/discover_response.json | head -c 2000 >&2
  exit 1
fi
if [ "$n_candidates" -lt 4 ]; then
  echo "--- WARNING: only $n_candidates candidates; the run may return fewer than the 4 minimum ---" >&2
fi

# ------------------------------------------------------------------ 3. TRIAGE

# No search tool, so this is one turn and costs cents regardless of list length.
# That asymmetry is the point: widening discovery is cheap, widening evaluate
# is not, so the funnel narrows here instead.
printf '%s\n' "$candidates" > /tmp/candidates.txt
echo "--- Phase 2: triage $n_candidates candidates (no searches) ---" >&2
triage_prompt=$(sed "s/{{TODAY}}/$today/g" "$SCRIPT_DIR/triage.md")
triage_prompt="${triage_prompt//\{\{CANDIDATES\}\}/$candidates}"
anthropic_call "$triage_prompt" 0 medium 4000 /tmp/triage_response.json

shortlist=$(response_text /tmp/triage_response.json | python3 -c '
import re, sys

# Map lowercased name -> the full candidate line, so the shortlist carries the
# url and description forward rather than just the bare names triage returns.
cands = {}
for line in open(sys.argv[1]):
    m = re.match(r"^-\s*(.+?)\s+—", line)
    if m:
        cands[m.group(1).strip().lower()] = line.rstrip("\n")

kept, unmatched = [], []
for line in sys.stdin:
    m = re.match(r"^\s*KEEP:\s*(.+?)\s*$", line)
    if not m:
        continue
    key = re.sub(r"\s+", " ", m.group(1)).strip().lower()
    if key not in cands:
        unmatched.append(m.group(1).strip())
    elif cands[key] not in kept:
        kept.append(cands[key])

if unmatched:
    print("--- triage named %d companies not in the candidate list (ignored): %s ---"
          % (len(unmatched), ", ".join(unmatched[:5])), file=sys.stderr)

# A format slip in triage must not cost the whole run. Falling through with the
# full list only over-spends evaluate; returning nothing would kill the run.
if not kept:
    print("--- triage returned no usable names; passing all candidates through ---", file=sys.stderr)
    kept = list(cands.values())

print("--- %d shortlisted for research ---" % len(kept), file=sys.stderr)
print("\n".join(kept))
' /tmp/candidates.txt)

n_shortlist=$(printf '%s' "$shortlist" | grep -c '^- ' || true)

# ---------------------------------------------------------------- 4. EVALUATE

echo "--- Phase 3: evaluate $n_shortlist shortlisted (max $EVALUATE_MAX_SEARCHES searches) ---" >&2
eval_prompt=$(sed "s/{{TODAY}}/$today/g" "$SCRIPT_DIR/evaluate.md")
eval_prompt="${eval_prompt//\{\{CANDIDATES\}\}/$shortlist}"
anthropic_call "$eval_prompt" "$EVALUATE_MAX_SEARCHES" medium 32000 /tmp/evaluate_response.json

# Extract assistant text, then pick the best draft out of it.
# The model drafts the report repeatedly between web searches — each draft is
# its own text block, so joining them concatenates every discarded draft.
# Splitting on "COMPANY 1" gives one candidate per draft. Taking the last one
# is wrong: a trailing partial pass (one entry, then stop) would beat a
# complete earlier draft. Take the candidate with the MOST entries instead,
# ties going to the later one. Falls back to the first marker or <div>.
raw=$(response_text /tmp/evaluate_response.json)
output=$(printf '%s' "$raw" | python3 -c '
import re, sys
s = sys.stdin.read()
ENTRY = re.compile(r"<!--\s*COMPANY\s*(\d+)\s*[:—–-]", re.I)
starts = [m.start() for m in ENTRY.finditer(s) if m.group(1) == "1"]
if starts:
    # A draft runs from its "COMPANY 1" to the next one (or EOF for the last).
    # Bounding matters: counting to EOF would score every draft as the whole
    # remaining text, so the first would always win and swallow the rest.
    bounds = list(zip(starts, starts[1:] + [len(s)]))
    # Score by entry count; the (i) tiebreak keeps the later draft when equal.
    best, end = max(bounds, key=lambda b: (len(ENTRY.findall(s[b[0]:b[1]])), b[0]))
    n = len(ENTRY.findall(s[best:end]))
    if len(starts) > 1:
        print("--- %d drafts found; kept the one with %d entries ---" % (len(starts), n), file=sys.stderr)
    if n < 3:
        print("--- WARNING: best draft has only %d entries ---" % n, file=sys.stderr)
    sys.stdout.write(s[best:end])
else:
    m = re.search(r"<!--\s*COMPANY|<div", s)
    sys.stdout.write(s[m.start():] if m else "")
')

if [ -z "$output" ]; then
  echo "--- No COMPANY marker or <div> in model output; refusing to send ---" >&2
  printf '%s' "$raw" | head -c 2000 >&2
  exit 1
fi

# Save to history and prune to last 3 runs (readable archive; git keeps the rest).
echo "$output" > "$HISTORY_DIR/$today.html"
ls -t "$HISTORY_DIR"/*.html | tail -n +4 | xargs rm -f 2>/dev/null || true

# Append this run's company names to the ledger, preserving first-seen order.
printf '%s' "$output" | python3 -c '
import re, sys
for n in re.findall(r"<!--\s*COMPANY\s*\d+\s*[:—–-]+\s*(.*?)\s*-->", sys.stdin.read(), re.I):
    n = re.sub(r"\s+", " ", n).strip()
    if n:
        print(n)
' >> "$LEDGER"
awk 'NF && !seen[tolower($0)]++' "$LEDGER" > "$LEDGER.tmp" && mv "$LEDGER.tmp" "$LEDGER"

echo "$output"
