# Git aliases
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcm='git checkout main'
alias gcd='git checkout dev'
alias gst='git status'
alias gac='git add -A && git commit -v'
alias guc='git add -u && git commit -v'

alias gb='git branch'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'

alias gcp='git cherry-pick'
alias gcpno='git cherry-pick --no-commit'

# Zellij aliases
alias zr='zellij run --'
alias ze='zellij edit'

# Command aliases

alias vim='hx'
alias tmux='zellij'

# Skim aliases

alias sgb='git branch --sort=-committerdate | sk --header "Checkout Recent Branch" --preview "git diff --color=always {1}" | xargs git checkout'

# Pacman aliases

alias upg='ame'
alias upgrepo='ame upg --repo'
alias upgaur='ame upg --aur'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias cleanup='pacman -Qtdq | sudo pacman -Rns -'
