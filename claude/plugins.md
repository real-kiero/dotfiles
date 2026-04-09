# Claude Code Plugins

## Installed on all machines

Install via Claude Code `/plugins` command or marketplace:

| Plugin | Purpose |
|---|---|
| commit-commands | `/commit` and `/commit-push-pr` for conventional commits |
| code-review | `/code-review` for structured review passes |
| hookify | Pre/post-tool hook rules (`.claude/hookify-rules/`) |

## Work machine only

| Plugin | Source |
|---|---|
| superpowers | Obtain from internal source and copy to `~/.claude/plugins/superpowers/` |
| codegraph | Obtain from internal source and copy to `~/.claude/plugins/codegraph/` |

## Per-machine settings

Settings that differ between machines (MCP servers, API keys, plugin auth) go in
`~/.claude/settings.local.json` — this file is gitignored and never committed.

Example work machine `settings.local.json`:
```json
{
  "mcpServers": {
    "your-internal-mcp": {
      "command": "...",
      "args": []
    }
  }
}
```
