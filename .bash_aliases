# Ls aliases

alias ll='exa -lhgF --git'
alias tree='exa -T --color=always --git-ignore --icons'
alias l.='exa -a | grep -E "^\."'

# Grep aliases

alias grep='grep --color=auto'

# Navigation aliases

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

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

alias gacp='git add -A && git commit && git push -u'

alias gcp='git cherry-pick'
alias gcpno='git cherry-pick --no-commit'

alias gd="git diff --name-only --relative --diff-filter=d | xargs bat --diff"

# Zellij aliases

alias zr='zellij run --'
alias ze='zellij edit'
alias zt='zellij action toggle-floating-panes'
alias helix='zellij --layout dev'

# Command aliases

alias cat='bat'
alias vim='hx'
alias tmux='zellij'
alias du='dust'

# Pacman aliases

alias upg='ame'
alias upgrepo='ame upg --repo'
alias upgaur='ame upg --aur'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'