#!/usr/bin/env bash

alias ls='eza --color-scale all'
alias ll='eza --icons -lah'
alias l.='eza -d .*'

alias cat='bat -pp'

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

