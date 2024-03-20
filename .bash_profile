# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
source "$HOME/.cargo/env"
source "$HOME/.config/broot/launcher/bash/br"

eval "$(zoxide init bash --cmd cd)"
eval "$(direnv hook bash)"
eval "$(starship init bash)"
eval "$(atuin init bash)"
