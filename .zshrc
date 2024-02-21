source $HOME/.profile

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit && compinit

source $HOME/.config/zinit/zinit.zsh

setopt auto_cd

source <(doctl completion zsh)

source <(kubectl completion zsh)

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh


if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

zle_highlight=('paste:none')


eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
