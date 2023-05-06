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

# Command aliases

alias cat='bat'
alias vim='hx'
alias tmux='zellij'
alias du='dust'

# DNF/Pacman aliases

alias upg="sudo dnf upgrade --refresh --best --allowerasing -y && flatpak update -y"
alias clean="sudo dnf autoremove -y && dnf clean all && flatpak uninstall --unused -y && sudo journalctl --vacuum-time=1weeks"
alias dnfr="sudo dnf autoremove"
alias dnfi="sudo dnf install"

# Flatpak aliases

alias fli="flatpak install --noninteractive -y flathub"
alias flr="flatpak remove --noninteractive -y"
alias flr="flatpak repair"
alias fll="flatpak list"
