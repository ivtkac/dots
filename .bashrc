# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc

# Source .profile
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.profile" ] && source "$HOME/.profile"

# Source aliases/functions definitions
while read -r f; do source "$f"; done < <(find "$HOME/.bashrc.d/" -name "*.sh" | sort)

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

# Enable Ctrl-O to open in editor
bind '"\ec": "$EDITOR .\n"'

eval "$(zoxide init bash)"
eval "$(direnv hook bash)"
eval "$(starship init bash)"

source /home/ivktac/.config/broot/launcher/bash/br
