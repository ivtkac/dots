if status is-interactive
    set -gx STARSHIP_CONFIG /etc/starship.toml
    set -gx LANG en_US.utf8
    eval "$(starship init fish)"
    eval "$(zoxide init fish --cmd cd)"
    eval "$(tv init fish)"
    set -gx HOST (hostname -s)

    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

    eval "$(pyenv init - fish)"
end
