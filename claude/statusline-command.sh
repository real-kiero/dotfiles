#!/usr/bin/env bash
# Claude Code status line script

input=$(cat)

# --- Extract fields from JSON ---
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
remaining_pct=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
five_hour=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_day=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')
session_name=$(echo "$input" | jq -r '.session_name // empty')
output_style=$(echo "$input" | jq -r '.output_style.name // empty')

# --- ANSI colors (will appear dimmed in status line) ---
RESET='\033[0m'
GREEN='\033[32m'
CYAN='\033[36m'
YELLOW='\033[33m'
RED='\033[31m'
BLUE='\033[34m'
MAGENTA='\033[35m'
DIM='\033[2m'

# --- Build parts ---
parts=()

# user@host:cwd (from PS1 pattern)
user_host_cwd="$(whoami)@$(hostname -s):${cwd:-$(pwd)}"
parts+=("$(printf "${GREEN}${user_host_cwd}${RESET}")")

# Git branch (if in a git repo)
git_branch=$(GIT_OPTIONAL_LOCKS=0 git -C "${cwd:-$(pwd)}" rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$git_branch" ]; then
    git_dirty=$(GIT_OPTIONAL_LOCKS=0 git -C "${cwd:-$(pwd)}" status --porcelain 2>/dev/null | wc -l | tr -d ' ')
    if [ "$git_dirty" -gt 0 ]; then
        parts+=("$(printf "${YELLOW}git:${git_branch}*${RESET}")")
    else
        parts+=("$(printf "${CYAN}git:${git_branch}${RESET}")")
    fi
fi

# Model
if [ -n "$model" ]; then
    parts+=("$(printf "${BLUE}${model}${RESET}")")
fi

# Context window usage
if [ -n "$remaining_pct" ]; then
    remaining_int=$(printf '%.0f' "$remaining_pct")
    if [ "$remaining_int" -le 10 ]; then
        color="${RED}"
    elif [ "$remaining_int" -le 25 ]; then
        color="${YELLOW}"
    else
        color="${CYAN}"
    fi
    parts+=("$(printf "${color}ctx:${remaining_int}%% left${RESET}")")
elif [ -n "$used_pct" ]; then
    used_int=$(printf '%.0f' "$used_pct")
    if [ "$used_int" -ge 90 ]; then
        color="${RED}"
    elif [ "$used_int" -ge 75 ]; then
        color="${YELLOW}"
    else
        color="${CYAN}"
    fi
    parts+=("$(printf "${color}ctx:${used_int}%% used${RESET}")")
fi

# Rate limits
rate_parts=()
if [ -n "$five_hour" ]; then
    five_int=$(printf '%.0f' "$five_hour")
    if [ "$five_int" -ge 90 ]; then
        color="${RED}"
    elif [ "$five_int" -ge 70 ]; then
        color="${YELLOW}"
    else
        color="${GREEN}"
    fi
    rate_parts+=("$(printf "${color}5h:${five_int}%%${RESET}")")
fi
if [ -n "$seven_day" ]; then
    week_int=$(printf '%.0f' "$seven_day")
    if [ "$week_int" -ge 90 ]; then
        color="${RED}"
    elif [ "$week_int" -ge 70 ]; then
        color="${YELLOW}"
    else
        color="${GREEN}"
    fi
    rate_parts+=("$(printf "${color}7d:${week_int}%%${RESET}")")
fi
if [ "${#rate_parts[@]}" -gt 0 ]; then
    parts+=("$(printf "${DIM}limits:${RESET}${rate_parts[*]}")")
fi

# Vim mode
if [ -n "$vim_mode" ]; then
    if [ "$vim_mode" = "NORMAL" ]; then
        parts+=("$(printf "${MAGENTA}[NORMAL]${RESET}")")
    else
        parts+=("$(printf "${GREEN}[INSERT]${RESET}")")
    fi
fi

# Session name (if set)
if [ -n "$session_name" ]; then
    parts+=("$(printf "${DIM}\"${session_name}\"${RESET}")")
fi

# Output style (if non-default)
if [ -n "$output_style" ] && [ "$output_style" != "default" ]; then
    parts+=("$(printf "${DIM}style:${output_style}${RESET}")")
fi

# --- Join with separator ---
sep="$(printf " ${DIM}|${RESET} ")"
result=""
for part in "${parts[@]}"; do
    if [ -z "$result" ]; then
        result="$part"
    else
        result="${result}${sep}${part}"
    fi
done

printf "%b\n" "$result"
