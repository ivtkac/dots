# Set the GPG_TTY to be the same as the TTY, either via the env var or via tty command.
export GPG_TTY=${TTY:-$(tty)}

# Enable using vi/vim as default editor of other programs.
# Setting ALTERNATE_EDITOR to nano
export EDITOR=helix
export ALTERNATE_EDITOR=nano

# Set the default pager
export VISUAL=${EDITOR}

# Readable time format
export HISTTIMEFORMAT="%F %T "

# Avoid duplicate history entries
export HISTCONTROL=ignoreboth:erasedups

# Increase history size. Doesn't appear to slow things down, so why not?
export HISTSIZE=524288
export HISTFILESIZE=131072

# Don't record some commands
export HISTIGNORE="&:[ ]*:ls:[bf]g:exit:history:pwd:clear:cd"

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
export CDPATH=".:~:$HOME/Projects"

# Exclude "." and ".." from glob expansion
export GLOBIGNORE=".:.."

# Set less options
export LESS="-R --use-color"

# Set man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"

export FZF_DEFAULT_OPTS="--style minimal --color 16 --layout=reverse --height 30% --preview='bat -p --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview"
