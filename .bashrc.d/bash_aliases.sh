#!/usr/bin/env bash

alias ls='eza --icons --color-scale all'
alias ll='ls -lah'
alias l.='ls -d .*'

alias less="less -R"

alias ..='cd ..'
alias ...="cd ../.."

alias proj='cd ~/Projects'
alias dots='cd ~/.dotfiles'

alias bat='bat --theme "Catppuccin"'

alias ports='netstat -tulanp'

alias cpuinfo='lscpu'
alias meminfo="free -h"

alias sys="systemctl"
alias src="source $HOME/.bashrc"

alias c="wl-copy"
alias v="nvim"
alias g="git"
alias t="type"
alias b="bat -p"
alias l="ls -l"

alias cpwd='pwd | tr -d "\n" | c'
