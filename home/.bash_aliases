#!/usr/bin/bash

# General aliases

alias ls='ls --color=auto'
[ -f /usr/bin/eza ] && alias ls="eza --icons"
alias la="ls -a"
alias l='ls -l'
alias ll='ls -l'
alias l.='ls -d .*'

alias cat="$(get_command bat cat)"

# Directory navigation
alias cd='$(get_command z cd)'
alias ..='cd ..'
alias ...='cd ../..'
alias ..3='cd_up 3'
alias ..4='cd_up 4'
alias ..5='cd_up 5'

alias proj='cd ~/Projects'

# Git aliases

# Basic Git Commands
alias gs='git status -s'
alias gb='git branch'
alias gf='git fetch'

# Checkout Commands
alias gco='git checkout'
alias gcb='git checkout -b'

# Commit Commands
alias gac='git add -A && git commit -v'
alias guc='git add -u && git commit -v'

# Push and Pull commands
alias gp='git push'
alias gpl='git pull'

# Advanced commands
alias gcp='git cherry-pick'
alias gcpno='git cherry-pick --no-commit'

# Custom Git Diff
alias gd='git_diff'

# Networking
alias ports='netstat -tulanp'
alias myip='curl ipinfo.io/ip'

# System information
alias cpuinfo='lscpu'
alias meminfo='free -h'

# Misc
alias py='python'

# Tools aliases
alias ld='lazydocker'
alias lg='lazygit'
