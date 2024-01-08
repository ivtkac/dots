#!/usr/bin/env bash
#
# ~/.bashrc
# The beginning of of everything.
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Pull in bash alias/functions definitions
while read -r f; do source "$f"; done < <(find "$HOME/.bashrc.d/" -name "*.sh" | sort)

# Settings
shopt -s autocd
shopt -s dirspell
shopt -s cdspell
shopt -s histappend
shopt -s cmdhist
shopt -s extglob

stty -ixon

# bind -x '"\t": fzf_bash_completion'
bind '"\ec": "$EDITOR .\n"'

# Prompt
PS1='\u@\[\e[34m\]\h\[\e[39m\] \w '

# General variables
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTCONTROL=ignorespace:erasedups
export HISTSIZE=2000
export CDPATH=".:~"
export GLOBIGNORE=".:.."

# Initialize directory jumper
eval "$(zoxide init bash)"
