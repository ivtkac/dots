# Onechar shortcuts
alias b='bat -pp'
alias v='nvim'
alias f='fzf'
alias c='wl-copy'
alias t='tmux'
alias g='git'

# ls aliases
alias ls='ls --color=auto'
alias l.='ls -d .*'
alias la='ls -a'
alias l1='ls -1'
alias ll='ls -lAh'
alias l='eza --sort=size --all --header --long --group-directories-first --icons always --git'


# Editors
alias zj='zellij'
alias ze='zellij'

alias hx='helix'
alias md='python -m textual'

alias vi='nvim'
alias vim='nvim'
alias code='nvim'

alias neofetch='fastfetch'

# Colors
alias grep='grep --color=auto'
alias less='less -R'

# Essentials
alias upd='sudo pacman -Syuv'
alias cpwd='pwd | tr -d "\n" | wl-copy'

# Easy navigate
alias ".."='cd ..'

# Git aliases
alias ga='git add'
alias gad='git add .'
alias gap='git add --patch'
alias grst='git restore'
alias gre='git reset'
alias gc='git commit'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git merge'
alias gss='git status'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpu='git pull'
alias gcp='git cherry-pick'
alias gcpno='git cherry-pick --no-commit'
alias gtv='git tag -v'
alias gf='git fetch'
alias gfu='git fetch upstream'
alias gsw='git switch'
alias gsc='git switch -c'
alias gbr='git branch'
alias glg='git log'
alias gsh='git stash'

# github-cli aliases
alias gi='gh issue'
alias gil='gh issue list'
alias giv='gh issue view'
alias gpr='gh pr'
alias ghpr='gh pr create'
alias gprl='gh pr list'
alias gprv='gh pr view'
alias gprc='gh pr checkout'
alias gbr='gh browse'

# vm aliases
alias vm='vboxmanage startvm OracleLinux9.5 --type headless 2>/dev/null; ssh vm'

# docker aliases

alias docker-ls-restart="docker container ls -q | xargs docker container inspect --format '{{ .Name }}: {{.HostConfig.RestartPolicy.Name}}'"
alias docker-stop-all="docker ps -q | xargs docker stop"
alias docker-compose-restart="docker compose up --force-recreate --build -d"
