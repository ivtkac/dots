#!/usr/bin/env bash

# Many things grubed from: https://github.com/ublue-os/toolboxes/blob/main/toolboxes/bluefin-cli/files/etc/profile.d/modern-unix.sh

# Eza for ls
alias ls='eza' 2>/dev/null
alias l.='eza -d .*' 2>/dev/null
alias ll='eza -l --icons=auto --group-directories-first' 2>/dev/null
alias l1='eza -1'

# Ripgrep for grep
alias grep'rg' 2>/dev/null
alias egrep='rg' 2>/dev/null
alias fgrep='rg -F' 2>/dev/null
alias xzgrep='rg -z' 2>/dev/null
alias xzegrep='rg -z' 2>/dev/null
alias xzfgrep='rg -z -F' 2>/dev/null

# Zoxide is handling cd
alias cd='cd' 2>/dev/null

# Fd for find
alias find='fd' 2>/dev/null

# Bat for cat
alias cat='bat -pp' 2>/dev/null

# Help for tldr
alias help='tldr' 2>/dev/null

# Replace tree with broot
alias tree='broot' 2>/dev/null

# Good aliases
alias vi='nvim'
alias vim='nvim'

alias less="less -R"

alias ..='cd ..'
alias ...="cd ../.."

alias cpuinfo='lscpu'
alias meminfo="free -h"

alias sys="systemctl"
alias src="source $HOME/.bashrc"


alias upd='paru -Syu'
alias fcd='cd $(fd -t d | fzf)'
alias cpwd='pwd | tr -d "\n" | c'

alias c="wl-copy"
alias v="nvim"
alias g="git"
alias t="type"
alias b="bat -p"
alias l="ls -l"
