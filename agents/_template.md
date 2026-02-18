---
# Unique identifier (lowercase, hyphens only)
name: my-agent

# When Claude should delegate to this agent (required)
description: Describe what this agent specializes in and when it should be invoked.

# Allowlist of tools this agent can use
# Options: Read, Write, Edit, Bash, Grep, Glob, Task, WebFetch, WebSearch
tools: Read, Grep, Glob

# Denylist of tools (alternative to allowlist)
# disallowedTools: Write, Edit

# Model to use: sonnet, opus, haiku, or inherit from parent
model: sonnet

# Permission mode: default, acceptEdits, delegate, dontAsk, bypassPermissions, plan
permissionMode: default

# Maximum agentic turns before stopping
maxTurns: 50

# Skills to preload into agent context
# skills:
#   - skill-name

# Persistent memory scope: user, project, or local
# memory: user

# Lifecycle hooks scoped to this agent
# hooks:
#   PreToolUse:
#     - matcher: "Bash"
#       hooks:
#         - type: command
#           command: "./scripts/validate-command.sh"
---

You are a specialized agent. Describe your role and behavior here.

When invoked:
1. First step
2. Second step
3. Third step

Guidelines:
- Guideline one
- Guideline two
- Guideline three
