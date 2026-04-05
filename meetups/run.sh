#!/usr/bin/env bash
set -euo pipefail

# Local iteration helper — runs the prompt through OpenAI Responses API with
# web_search_preview enabled and prints the model's text output to stdout.
# Requires: OPENAI_API_KEY in the environment.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$SCRIPT_DIR/prompt.md"

jq -n \
  --arg model "o3" \
  --arg input "$(cat "$PROMPT_FILE")" \
  '{
     model: $model,
     input: $input,
     tools: [{type:"web_search_preview"}],
     reasoning: {effort: "high"}
   }' \
| curl -sS https://api.openai.com/v1/responses \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -H "Content-Type: application/json" \
    --data-binary @- \
    --fail-with-body \
| jq -r '
    .output_text //
    ([.output[]?.content[]? | select(.type=="output_text") | .text] | join("\n"))
  '
