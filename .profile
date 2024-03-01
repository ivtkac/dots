# .profile

# Set the GPG_TTY to be the same as the TTY, either via the env var or via the tty command.
export GPG_TTY=${TTY:-$(tty)}

# Add local bin directories to PATH
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Enable using nvim as default editor of other programs.
# Setting ALTERNATE_EDITOR like this make nano default, if it can't be found.
export EDITOR="nvim"
export ALTERNATE_EDITOR="nano"

# Set default pager
export VISUAL="$EDITOR"

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
export CDPATH=".:~"

# Exlude "." and ".." from glob expansion
export GLOBIGNORE=".:.."

. "$HOME/.cargo/env"
