if status is-interactive
    set -gx STARSHIP_CONFIG /etc/starship.toml
    set -gx LANG en_US.utf8
    eval "$(starship init fish)"
    eval "$(atuin init fish)"
    eval "$(zoxide init fish --cmd cd)"
    set -gx HOST (hostname -s)
end
