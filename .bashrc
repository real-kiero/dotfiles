# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Update window size after each command
shopt -s checkwinsize

# Terminal colors
export TERM=xterm-256color

# Color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Custom aliases
alias vf="nvim -c 'Telescope find_files'"
alias vo="nvim -c 'Telescope oldfiles'"
alias vim='nvim'
alias cd='z'
alias activate='source .venv/bin/activate'
alias glf='git log --name-status --oneline'
alias gbc='git log --name-status --oneline master..HEAD'
alias gbcme='git log --name-status --oneline --author="$(git config user.name)" master..HEAD'

# Source additional aliases if they exist
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# PATH modifications
export PATH="$HOME/.local/bin:$PATH"

# Starship prompt
eval "$(starship init bash)"

# Zoxide (better cd)
eval "$(zoxide init bash)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
