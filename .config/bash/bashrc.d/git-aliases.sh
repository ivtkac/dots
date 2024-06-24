#!/usr/bin/env bash

alias gc='git commit'
alias gf='git fetch'
alias gd='git diff'

alias gco='git checkout $(gb)'
alias gcb='git checkout -b'

# Push and Pull commands
alias gp='git push'
alias gpl='git pull'
alias gpp='git pull $(gr) $(gb)'
alias gps='git push $(gr) $(gb)'

# Advanced commands
alias gcp='git cherry-pick'
alias gcpno='git cherry-pick --no-commit'


alias gtv='git tag -v $(gt)'

alias gcpy='git rev-parse $(gl) | c'

alias gups='git config --get remote.origin.url | sed -E "s|.*github.com/||g" | xargs -I '{}' curl -s "https://api.github.com/repos/{}" | jq -r '.source.clone_url''

alias git-addups='git remote add base "$(gups)"'

alias ghpr='gh pr create'
alias prls='gh pr ls'
