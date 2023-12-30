# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Update window size after every command
shopt -s checkwinsize

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# PS1='[\u@\h \W]\$ '
if [ -n "$TOOLBOX_PATH" ]; then
    PS1='\[\033[0;35m\]\u\[\033[0m\]@\h \W>\[\033[0m\] '
elif [ -n "$DISTROBOX_ENTER_PATH" ]; then
    PS1='\[\033[0;33m\]\u\[\033[0m\]@\h \W>\[\033[0m\] '
else   
    PS1='\[\033[0;34m\]\u\[\033[0m\]@\h \W>\[\033[0m\] '
fi

# Export XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Load all .bash files in XDG_CONFIG_HOME/bash
if [ -d "$XDG_CONFIG_HOME/bash" ]; then
    for file in "$XDG_CONFIG_HOME/bash"/*; do
        if [ -f "$file" ]; then
            . "$file"
        fi
    done
fi

set_editor
init_command zoxide "zoxide init bash"
