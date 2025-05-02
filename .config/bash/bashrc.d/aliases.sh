alias please='sudo'

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias l.='ls -d .*'
alias la='ls -A'
alias l1='ls -1'

# Text processing
alias grep='grep --color=auto'
alias less='less -R'

# Essentials utilities
alias ".."='cd ..'
alias cpwd='pwd | tr -d "\n" | wl-copy'

# Git aliases
alias ,a='git add'
alias ,ad='git add .'
alias ,ap='git add --patch'
alias ,r='git restore'
alias ,rs='git restore --staged'
alias ,re='git reset'
alias ,c='git commit'
alias ,ca='git commit --amend'
alias ,co='git checkout'
alias ,cb='git checkout -b'
alias ,d='git diff'
alias ,dc='git diff --cached'
alias ,m='git merge'
alias ,s='git status'
alias ,p='git push'
alias ,pf='git push --force-with-lease'
alias ,pu='git pull'
alias ,f='git fetch'
alias ,fu='git fetch upstream'
alias ,sw='git switch'
alias ,sc='git switch -c'
alias ,b='git branch'
alias ,l='git log'
alias ,st='git sattsh'
alias ,cp='git cherry-pick'
alias ,cpno='git cherry-pick --no-commit'

# github-cli aliases
alias gi='gh issue'
alias gil='gh issue list'
alias giv='gh issue view'
alias gpr='gh pr'
alias grl='gh pr list'
alias grv='gh pr view'
alias grc='gh pr checkout'
alias gbr='gh browse'

# vm aliases
alias vm='vboxmanage startvm OracleLinux9.5 --type headless 2>/dev/null; ssh padavan@vm'

# docker aliases
alias docker-ls-restart="docker container ls -q | xargs docker container inspect --format '{{ .Name }}: {{.HostConfig.RestartPolicy.Name}}'"
alias docker-stop-all="docker ps -q | xargs docker stop"
alias docker-compose-restart="docker compose up --force-recreate --build -d"

# Permissions aliases
alias chownme='sudo chown -R $USER:$USER'
alias chx='chmod +x'
alias perm="stat --format '%A %a %n'"

# Alias for file management
alias tree='tree -C'
alias fstor='sudo find / -type f -exec du -h {} + | sort -hr | head'
alias ducwd='du -sh * .[!.]* | sort -h'

# Aliases for process management
alias lsdof='sudo lsof +L1'
alias psa='ps aux'
alias psf='ps auxf'
alias psmem='ps -eo pid,ppid,cmd,rss,stat,%mem,%cpu --sort=-%mem | head'

# Find files and directories
alias ff='find . -type f -iname'
alias fdir='find . -type d -iname'

# Aliases for system management
alias batcheck='upower -i $(upower -e | grep "BAT")'
