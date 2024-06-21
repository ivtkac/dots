_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
[ -f "$_config_dir/profile" ] || return 0

. "$_config_dir/profile"

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export ZINIT_HOME="$XDG_DATA_HOME/zsh/zinit"

export SAVEHIST="$HISTFILE"

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
