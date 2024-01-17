#!/usr/bin/env bash
#
# ~/.bashrc
# The beginning of of everything.
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Pull in bash alias/functions and completion definitions
while read -r f; do source "$f"; done < <(find "$HOME/.bashrc.d/" "$HOME/.bash_completion.d/" -name "*.sh" | sort)

# fzf bindings
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash

## Settings

# Prepend cd to directory names automatically
shopt -s autocd

# Correct spelling errors during tab-completion
shopt -s dirspell

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Allow expanded glob syntax
shopt -s extglob

# Disable Ctrl-S and Ctrl-Q
stty -ixon

# Enable programmable completion features
bind -x '"\t": fzf_bash_completion'

# Enable Ctrl-O to open in editor
bind '"\ec": "$EDITOR .\n"'

# Prompt
PS1='\u@\[\e[34m\]\h\[\e[39m\] \w '

## General variables

# Enable using helix as default editor of other programs.
# Setting ALTERNATE_EDITOR like this make nvim default, if it can't be found.
export EDITOR="helix"
export ALTERNATE_EDITOR="nvim"

# Set default pager
export VISUAL="$ALTERNATE_EDITOR"

# Readable time format
export HISTTIMEFORMAT="%F %T "

# Avoid duplicates in history
export HISTCONTROL=ignorespace:erasedups

# Increase history size. Doesn't apper to slow things down, so why not?
export HISTSIZE=524288
export HISTFILESIZE=131072

# Don't record some commands
export HISTIGNORE="&:[ ]*:ls:[bf]g:exit:history:pwd:clear:cd:cd -:cd ..:cd ~:cd -"

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
export CDPATH=".:~:~/Projects/"

# Exclude "." and ".." from glob expansion
export GLOBIGNORE=".:.."

# Initialize directory jumper
eval "$(zoxide init bash)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
