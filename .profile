# .profile

# Set the GPG_TTY to be the same as the TTY, either via the env var or via the tty command.
export GPG_TTY=${TTY:-$(tty)}

# XDG base directory specification
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Set the PATH so it includes user's private bin if it exists
export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.dotnet/tools:$PATH"

# Enable using nvim as default editor of other programs.
# Setting ALTERNATE_EDITOR like this make nano default, if it can't be found.
export EDITOR=nvim
export ALTERNATE_EDITOR=helix

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

# Set less options
export LESS='-R --use-color -Dd+r$Du+b$'

# Man pages
export MANPAGER='nvim +Man!'

# Ripgrep config
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/.ripgreprc"

# OpenAI API key
export OPENAI_API_KEY=`pass show api/openai`
