# Ls aliases
alias ll='ls -l'
alias la='ls -a'
alias lT='ls -T'

# Git aliases
alias gcb='git checkout -b'
alias gco='git checkout'

alias gcm='git commit -m'

alias gs='git status'
alias gss='git status -s'

alias gac='git add -A && git commit -v'
alias guc='git add -u && git commit -v'

alias gb='git branch'

alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'

alias gcp='git cherry-pick'
alias gcpno='git cherry-pick --no-commit'

alias zr='zellij run --'
alias ze='zellij edit'

alias vim='hx'
alias tmux='zellij'
alias cat='bat'
alias du='dust'

# Pacman & AUR aliases

alias upg='sudo pacman -Syu'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias cleanup='pacman -Qtdq | sudo pacman -Rns -'

