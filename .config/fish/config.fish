set fish_greeting

set VIRTUAL_ENV_DISABLE PROMPT "1"

fish_add_path ~/.local/bin

set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux EDITOR (which hx)
set -Ux VISUAL EDITOR

fish_vi_key_bindings
