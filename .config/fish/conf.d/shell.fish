set fish_greeting

set VIRTUAL_ENV_DISABLE PROMPT "1"

fish_vi_key_bindings

eval "$(zoxide init fish --cmd z)"
eval "$(starship init fish)"
eval "$(direnv hook fish)"
eval "$(mise activate fish)"
