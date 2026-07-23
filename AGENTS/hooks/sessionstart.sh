#!/bin/bash
# =================================================
# @file sessionstart.sh - session start hook script
# =================================================
# @description
# - runs before user begins typing
# - creates today's log file if none exists yet
# - injects today's log + most recent prior log + README.md into session context
# - works with `claude`; does not work with `grok`
# @see AGENTS.md, AGENTS/logs.md, /AGENTS/logs/

TODAY_LOG="AGENTS/logs/$(date +%Y-%m-%d).md"
PREV_LOG=$(ls -1 AGENTS/logs/*.md 2>/dev/null | grep -vF "$TODAY_LOG" | sort -r | head -1)
READ_ME="README.md"
CHAR_LIMIT=6000

# make today's log file if one doesn't exist
if [ ! -f "$TODAY_LOG" ];
then mkdir -p AGENTS/logs; echo "# $TODAY_LOG" > "$TODAY_LOG"; fi

# truncates files to preserve context window
truncFile() {
  local file="$1"
  local size
  size=$(wc -c < "$file" | tr -d ' ')
  if [ "$size" -gt "$CHAR_LIMIT" ];
  then tail -c "$CHAR_LIMIT" "$file"
  else cat "$file"; fi
}

TODAY_LOG_TRUNC=$(truncFile "$TODAY_LOG")

if [ -n "$PREV_LOG" ];
then PREV_LOG_TRUNC=$(truncFile "$PREV_LOG")
else PREV_LOG_TRUNC="(no prior log found)"; fi

if [ -f "$READ_ME" ];
then README_FULL=$(cat "$READ_ME")
else README_FULL="(README.md not found)"; fi

# inject files into session context
jq -n \
  --arg readMe "$README_FULL" \
  --arg todayLog "$TODAY_LOG_TRUNC" \
  --arg prevLog "$PREV_LOG_TRUNC" \
  '{
    hookSpecificOutput: {
      hookEventName: "SessionStart",
      additionalContext: ($readMe + "\n\n" + $prevLog + "\n\n" + $todayLog)
    }
  }'
