[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"/zcompcache
compinit -d "$XDG_CACHE_HOME/zsh"/zcompdump-$ZSH_VERSION

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# TODO: DRY this up and reuse $XDG_CONFIG/bash/bashrc.d/bash_aliases.sh
alias ls='eza' 2>/dev/null
alias l.='eza -d .*' 2>/dev/null
alias ll='eza -l --icons=auto --group-directories-first' 2>/dev/null
alias l1='eza -1' 2>/dev/null

alias grep='rg' 2>/dev/null
alias egrep='rg' 2>/dev/null
alias fgrep='rg -F' 2>/dev/null
alias xzgrep='rg -z' 2>/dev/null
alias xzegrep='rg -z' 2>/dev/null
alias xzfgrep='rg -z -F' 2>/dev/null

# Zoxide is handling cd
alias cd='cd' 2>/dev/null

# Fd for find
alias find='fd' 2>/dev/null

# Bat for cat
alias cat='bat -pp' 2>/dev/null

# Help for tldr
alias help='tldr' 2>/dev/null

# Replace tree with broot
alias tree='broot' 2>/dev/null

# Replace tmux with zellij
alias tmux='zellij' 2>/dev/null

# Good aliases
alias vi='nvim'
alias vim='nvim'

alias less="less -R"

alias cpuinfo='lscpu'
alias meminfo="free -h"

alias sys="systemctl"

alias upd='paru -Syu'
alias fcd='cd $(fd -t d | fzf)'
alias cpwd='pwd | tr -d "\n" | c'

alias c="wl-copy"
alias v="nvim"
alias g="git"
alias t="type"
alias b="bat -p"
alias l="ls -l"

source /home/ivktac/.config/broot/launcher/bash/br
