# Straship prompt
if status --is-interactive
  # b asename "$PWD"
  starship init fish | source
end

# Fish shell basic

set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"

set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux EDITOR (which hx)
set -Ux VISUAL EDITOR


fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.deno/bin

fish_vi_key_bindings
