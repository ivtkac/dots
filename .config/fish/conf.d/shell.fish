set fish_greeting

set VIRTUAL_ENV_DISABLE PROMPT "1"

fish_add_path $HOME/.local/bin

fish_vi_key_bindings

eval "$(zoxide init fish --cmd z)"
eval "$(starship init fish)"
eval "$(direnv hook fish)"
