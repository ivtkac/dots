#!/usr/bin/env bash

alias bat='bat --theme "TwoDark"'
alias ls='eza --icons --color-scale all'
alias ll='ls -lah'
alias l.='ls -d .*'

alias ..='cd ..'
alias ...='cd ../..'
alias ..3='cd_up 3'
alias ..4='cd_up 4'
alias ..5='cd_up 5'

alias proj='cd ~/Projects'
alias dot='cd ~/Projects/dotfiles'

alias ports='netstat -tulanp'

alias cpuinfo='lscpu'
alias meminfo='free -h'

alias py='python'

alias ld='lazydocker'
alias lg='lazygit'

alias cg='cargo'
alias pacman='sudo pacman'
alias pac='pacman'
alias upd='paru -Syuv'
alias sys='systemctl'
alias rm='trash'
alias src='source $HOME/.bashrc'
alias less='less -R'
alias cpwd='pwd | tr -d "\n" | c'
alias fx='felix'
alias hx='helix'

alias v='nvim'
alias h='helix'
alias g='git'
alias t='type'
alias c='wl-copy'
alias b='bat -p'
alias l='ls -l'
