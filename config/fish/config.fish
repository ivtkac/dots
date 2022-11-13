if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux EDITOR hx

set -Ux HELIX_RUNTIME ~/.local/share/helix/runtime

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.deno/bin

fish_vi_key_bindings

starship init fish | source
zoxide init fish | source
