# Ls aliases

alias exa='exa -al --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='ls -a | grep -E "^\."'

# Grep aliases

alias grep='grep --color=auto'

# Navigation aliases

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

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

# Pacman aliases

alias upg='ame'
alias upgrepo='ame upg --repo'
alias upgaur='ame upg --aur'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'