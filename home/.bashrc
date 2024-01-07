# .bashrc

[[ $- != *i* ]] && return

# Source functions and aliases
[ -f "$HOME/.bash_functions" ] && . "$HOME/.bash_functions"
[ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"

# Set up Path
pathadd "$HOME/.local/bin"
pathadd "$HOME/.cargo/bin"

# Initialize Environment
set_editor
init_command zoxide "zoxide init bash"
init_command starship "starship init bash"

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt
if ((BASH_VERSINFO[0] >= 4)); then
    PROMPT_DIRTRIM=2
fi

# Turn on recursive globbing (enables ** to recurse all directories)
if ((BASH_VERSINFO[0] >= 4)); then
    shopt -s globstar
fi

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Huge history. Doesn't apper to slow things down, so why not?
HISTSIZE=524288
HISTFILESIZE=131072

# Avoid duplicate entries
HISTCONTROL=erasedups:ignoreboth

# Don't record some commands
HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Readable time format
HISTTIMEFORMAT='%F %T '

# Directory navigation

if ((BASH_VERSINFO[0] >= 4)); then
    # Prepend cd to directory names automatically
    shopt -s autocd

    # Correct spelling errors during tab-completion
    shopt -s dirspell

    # Correct spelling errors in arguments supplied to cd
    shopt -s cdspell
fi

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
CDPATH=".:~"

# Allow expanded glob syntax
shopt -s extglob

# Exclude "." and ".." from glob expansion
GLOBIGNORE=".:.."

# Set PS1
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ "
