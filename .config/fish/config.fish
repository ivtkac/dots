set fish_greeting

set VIRTUAL_ENV_DISABLE PROMPT "1"

fish_add_path $HOME/.local/bin

fish_vi_key_bindings

alias cat='bat -pp'
alica cp='cp -iv'
alias fcd='cd $(fd -t d | fzf)'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gp='git push'
alias mv='mv -iv'
alias rm='rm -iv'
