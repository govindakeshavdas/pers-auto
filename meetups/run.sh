#!/usr/bin/env bash
set -euo pipefail

# Runs the meetup-finder prompt through Claude CLI and writes the result to
# stdout. The GitHub Actions workflow captures this output and emails it.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$SCRIPT_DIR/prompt.md"

claude -p "$(cat "$PROMPT_FILE")" \
  --allowed-tools "WebSearch,WebFetch" \
  --output-format text
