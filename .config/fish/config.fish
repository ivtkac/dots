set fish_greeting

set VIRTUAL_ENV_DISABLE PROMPT "1"

fish_add_path $HOME/.local/bin

set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux MANROFFOPT "-c"

set -Ux EDITOR (which nvim)
set -Ux VISUAL EDITOR

fish_vi_key_bindings

starship init fish | source
zoxide init fish | source
direnv hook fish | source
