---
# Skill identifier (becomes the slash command: /my-skill)
name: my-skill

# When Claude should use this skill
description: Describe what this skill does and when it should be triggered.

# Set to true to make this available as a /slash command
user-invocable: true

# Hint shown in autocomplete menu
argument-hint: "[argument description]"

# Tools Claude can use without asking when this skill is active
# allowed-tools: Read, Grep, Glob

# Model override (sonnet, opus, haiku, or inherit)
# model: inherit

# Set to true to prevent Claude from auto-invoking this skill
# disable-model-invocation: false

# Run in isolated subagent context: fork
# context: fork

# Subagent type when context is fork
# agent: Explore

# Lifecycle hooks scoped to this skill
# hooks:
#   PreToolUse:
#     - matcher: "Bash"
#       hooks:
#         - type: command
#           command: "./scripts/validate.sh"
---

Instructions for this skill go here.

When invoked with `/my-skill [arguments]`:
1. First step
2. Second step
3. Third step

## Notes

- Use `$ARGUMENTS` to reference all arguments passed to the skill
- Use `$ARGUMENTS[0]` or `$0` for specific positional arguments
- Use `` !`command` `` syntax to run shell commands before the skill prompt is sent
- Use `${CLAUDE_SESSION_ID}` to reference the current session ID
