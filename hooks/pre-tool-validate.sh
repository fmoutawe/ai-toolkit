#!/usr/bin/env bash
#
# Example PreToolUse hook for Claude Code
#
# This script receives JSON on stdin with the tool invocation details.
# Exit codes:
#   0 = allow the tool call to proceed
#   2 = block the tool call (with reason on stdout as JSON)
#
# Input JSON shape:
#   {
#     "tool_name": "Bash",
#     "tool_input": {
#       "command": "rm -rf /",
#       "description": "...",
#       ...
#     },
#     "session_id": "...",
#     "project_dir": "..."
#   }

set -euo pipefail

# Read the hook input
INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
# TOOL_INPUT=$(echo "$INPUT" | jq -r '.tool_input // empty')

# --- Example: Block dangerous commands ---
# Uncomment to block rm -rf, format, or mkfs commands:
#
# if [ "$TOOL_NAME" = "Bash" ]; then
#   COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
#   if echo "$COMMAND" | grep -qE '(rm\s+-rf\s+/|mkfs\.|format\s+)'; then
#     echo '{"decision": "block", "reason": "Blocked: dangerous destructive command detected"}'
#     exit 2
#   fi
# fi

# --- Example: Warn on Write to certain paths ---
# Uncomment to add a warning when writing to config files:
#
# if [ "$TOOL_NAME" = "Write" ] || [ "$TOOL_NAME" = "Edit" ]; then
#   FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
#   if echo "$FILE_PATH" | grep -qE '\.(env|secret|key)$'; then
#     echo '{"continue": true, "systemMessage": "Warning: modifying a sensitive file"}'
#     exit 0
#   fi
# fi

# Allow by default
exit 0
