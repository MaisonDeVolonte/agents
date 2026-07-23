#!/bin/bash
# ==============================================
# @file posttooluse.sh - posttooluse hook script
# ==============================================
# @description
# - runs after Write|Edit succeeds
# - extracts the touched file path from claude or grok payloads
# - runs `eslint --fix` if it's a js/jsx/ts/tsx file
# - silent on non-fixable issues, never blocks the turn
# @see AGENTS.md, .claude/settings.json, .grok/settings.json, .grok/hooks/

FILE=$(jq -r '
  .tool_response.filePath
  // .tool_response.file_path
  // .tool_input.file_path
  // .toolInput.file_path
  // .toolInput.path
  // empty
')

case "$FILE" in
  *.js|*.jsx|*.ts|*.tsx) npx eslint --fix "$FILE" 2>/dev/null ;;
esac

exit 0
