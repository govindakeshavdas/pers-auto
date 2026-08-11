#!/usr/bin/env bash
set -euo pipefail

# Calls the Anthropic Messages API directly with the server-side web_search
# tool and prints the model's final text to stdout.
# Requires: ANTHROPIC_API_KEY (loaded from repo-root .env if present).

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$SCRIPT_DIR/prompt.md"

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

# Previously covered companies: names only, every run to date.
# Deliberately NOT the past HTML — feeding whole outputs back made the model
# imitate their structure and verdicts instead of just skipping the names.
previous=$(cat "$LEDGER")
if [ -z "$previous" ]; then
  previous="(No previous runs yet — this is the first one.)"
fi

prompt=$(sed "s/{{TODAY}}/$today/g" "$PROMPT_FILE")
prompt="${prompt//\{\{PREVIOUS_RESULTS\}\}/$previous}"

payload=$(printf '%s' "$prompt" | jq -Rs \
  --arg model "claude-opus-4-6" \
  '{
     model: $model,
     max_tokens: 64000,
     thinking: {type: "enabled", budget_tokens: 50000},
     tools: [{type: "web_search_20250305", name: "web_search", max_uses: 30}],
     messages: [{role: "user", content: .}]
   }')

echo "--- Anthropic request payload (prompt truncated) ---" >&2
echo "$payload" | jq '{model, max_tokens, thinking, tools}' >&2

http_code=$(printf '%s' "$payload" | curl -sS -o /tmp/anthropic_response.json -w "%{http_code}" \
    https://api.anthropic.com/v1/messages \
    -H "x-api-key: $ANTHROPIC_API_KEY" \
    -H "anthropic-version: 2023-06-01" \
    -H "Content-Type: application/json" \
    -d @-)

if [ "$http_code" -ge 400 ]; then
  echo "--- Anthropic API error ($http_code) ---" >&2
  cat /tmp/anthropic_response.json >&2
  exit 1
fi

# Extract assistant text, then slice from the LAST "COMPANY 1" marker.
# The model drafts the report repeatedly between web searches — each draft is
# its own text block, and joining them all concatenates every discarded draft.
# Only the final draft is the report; everything before it is scratchpad.
# Fall back to the first COMPANY marker or <div> if no numbered marker is found.
raw=$(jq -r '[.content[]? | select(.type=="text") | .text] | join("\n")' /tmp/anthropic_response.json)
output=$(printf '%s' "$raw" | python3 -c '
import re, sys
s = sys.stdin.read()
starts = [m.start() for m in re.finditer(r"<!--\s*COMPANY\s*1\s*[:—–-]", s, re.I)]
if starts:
    sys.stdout.write(s[starts[-1]:])
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
