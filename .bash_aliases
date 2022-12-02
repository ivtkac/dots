# Git aliases

alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gac='git add -A && git commit -v'
alias guc='git add -u && git commit -v'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gcp='git cherry-pick'
alias gcpno='git cherry-pick --no-commit'

# Skim aliases

alias sgb='git branch --sort=-committerdate | sk --header "Checkout Recent Branch" --preview "git diff --color=always {1}" | xargs git checkout'

