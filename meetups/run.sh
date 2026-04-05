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

response=$(jq -n \
  --arg model "claude-sonnet-4-5" \
  --arg prompt "$(cat "$PROMPT_FILE")" \
  '{
     model: $model,
     max_tokens: 4096,
     tools: [{type: "web_search_20250305", name: "web_search", max_uses: 10}],
     messages: [{role: "user", content: $prompt}]
   }' \
| curl -sS https://api.anthropic.com/v1/messages \
    -H "x-api-key: $ANTHROPIC_API_KEY" \
    -H "anthropic-version: 2023-06-01" \
    -H "Content-Type: application/json" \
    --data-binary @- \
    --fail-with-body)

# Extract final assistant text (concat all text blocks, skip tool_use blocks).
echo "$response" | jq -r '[.content[]? | select(.type=="text") | .text] | join("\n")'
