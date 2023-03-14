#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /usr/share/blesh/ble.sh ]; then
	. /usr/share/blesh/ble.sh
fi


# Exports

export EDITOR=hx
export VISUAL=$EDITOR
export HELIX_RUNTIME=~/.local/share/helix/runtime

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PATH="$PATH:~/.local/bin:~/.cargo/bin:~/.deno/bin"

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
		. ~/.bash_functions
fi

hash zoxide && eval "$(zoxide init bash)"
hash starship && eval "$(starship init bash)"
hash atuin && eval "$(atuin init bash)"

[[ ${BLE_VERSION-} ]] && ble-attach
