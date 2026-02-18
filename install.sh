#!/usr/bin/env bash
set -euo pipefail

echo "=== Installing Claude Code plugins ==="

echo "Installing osgrep (semantic code search)..."
npm install -g osgrep
echo "Setting up osgrep models (~150MB download)..."
osgrep setup

echo ""
echo "=== Installing marketplace skills ==="

echo "Installing Vercel React Best Practices..."
npx skills add vercel-labs/agent-skills --skill vercel-react-best-practices

echo "Installing Next.js Best Practices..."
npx skills add vercel-labs/next-skills --skill next-best-practices

echo "Installing Next.js Upgrade Guide..."
npx skills add vercel-labs/next-skills --skill next-upgrade

echo "Installing Next.js Cache Components..."
npx skills add vercel-labs/next-skills --skill next-cache-components

echo ""
echo "=== Setup complete ==="
echo ""
echo "Next steps:"
echo "  1. Copy mcp-servers.example.json to ~/.mcp.json"
echo "  2. Fill in your API tokens in ~/.mcp.json:"
echo "     - GITHUB_PERSONAL_ACCESS_TOKEN for GitHub MCP"
echo "  3. Edit CLAUDE.md with your personal preferences"
echo "  4. Edit settings.json to customize permissions and hooks"
