#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa --color=always'
alias ll='ls -l'
alias la='ls -a'

alias gcb='git checkout -b'
alias gco='git checkout'
alias gst='git status'
alias gac='git add -A && git commit'
alias guc='git add -u && git commit'

alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'

alias gcp='git cherry-pick'
alias gcpno='git cherry-pick --no-commit'

alias zr='zellij run --'
alias ze='zellij edit'

export EDITOR=hx
export HELIX_RUNTIME=~/.local/share/helix/runtime

export PATH="$PATH:~/.local/bin"
export PATH="$PATH:~/.cargo/bin"
export PATH="$PATH:~/.deno/bin"

PS1='[\u@\h \W]\$ '
