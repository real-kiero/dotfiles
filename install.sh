#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"
    echo "  linked $dst"
}

echo "==> shell"
link "$DOTFILES/.bashrc"   "$HOME/.bashrc"
link "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
link "$DOTFILES/pyrightconfig.json" "$HOME/pyrightconfig.json"

echo "==> claude"
link "$DOTFILES/claude/CLAUDE.md"              "$HOME/.claude/CLAUDE.md"
link "$DOTFILES/claude/settings.json"          "$HOME/.claude/settings.json"
link "$DOTFILES/claude/statusline-command.sh"  "$HOME/.claude/statusline-command.sh"

echo "==> done"
echo ""
echo "Machine-specific Claude overrides: ~/.claude/settings.local.json (not tracked)"
echo "Plugin installs: see claude/plugins.md"
