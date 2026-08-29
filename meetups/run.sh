#!/usr/bin/env bash
set -euo pipefail

# Calls the Anthropic Messages API directly with the server-side web_search
# tool and prints the model's final HTML to stdout.
# Requires: ANTHROPIC_API_KEY (loaded from repo-root .env if present).

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$SCRIPT_DIR/prompt.md"
MAX_TURNS=8

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
prompt=$(sed "s/{{TODAY}}/$today/g" "$PROMPT_FILE")

# The conversation lives in files, never on a command line. Message history
# grows past ARG_MAX once web_search results are embedded in it, and passing
# it via jq --argjson dies with "Argument list too long".
tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT
msgfile="$tmpdir/messages.json"
bodyfile="$tmpdir/body.json"
respfile="$tmpdir/response.json"

jq -n --arg prompt "$prompt" '[{role: "user", content: $prompt}]' > "$msgfile"

# Server-side web_search runs its own loop and returns stop_reason "pause_turn"
# when it hits the 10-iteration limit. To resume, re-send the conversation with
# the assistant's content appended (thinking blocks and all, unchanged) -- the
# API sees the trailing server_tool_use block and continues on its own. No
# extra user message.
for turn in $(seq 1 "$MAX_TURNS"); do
  jq -n \
    --arg model "claude-opus-4-6" \
    --slurpfile messages "$msgfile" \
    '{
       model: $model,
       max_tokens: 64000,
       thinking: {type: "enabled", budget_tokens: 50000},
       tools: [{type: "web_search_20250305", name: "web_search", max_uses: 60}],
       messages: $messages[0]
     }' > "$bodyfile"

  if ! curl -sS https://api.anthropic.com/v1/messages \
      -H "x-api-key: $ANTHROPIC_API_KEY" \
      -H "anthropic-version: 2023-06-01" \
      -H "Content-Type: application/json" \
      --data-binary @"$bodyfile" \
      --fail-with-body \
      -o "$respfile"; then
    echo "Anthropic API error:" >&2
    cat "$respfile" >&2
    exit 1
  fi

  stop=$(jq -r '.stop_reason // "unknown"' "$respfile")
  echo "turn $turn: stop_reason=$stop" >&2

  if [ "$stop" != "pause_turn" ]; then
    break
  fi

  jq -s '.[0] + [{role: "assistant", content: .[1].content}]' \
    "$msgfile" "$respfile" > "$tmpdir/next.json"
  mv "$tmpdir/next.json" "$msgfile"
done

if [ "$stop" = "pause_turn" ]; then
  echo "Still paused after $MAX_TURNS turns; output may be incomplete." >&2
fi

# Pull out the text blocks, then drop everything before the first HTML tag.
# The model narrates between (and after) its searches -- "Let me check one
# more source" etc. -- and that commentary is what used to end up in the email.
text=$(jq -r '[.content[]? | select(.type == "text") | .text] | join("\n")' "$respfile")
html=$(printf '%s' "$text" | sed -n '/^[[:space:]]*</,$p')

if [ -z "$html" ]; then
  echo "No HTML fragment found in the response; emitting raw text." >&2
  printf '%s\n' "$text"
else
  printf '%s\n' "$html"
fi
