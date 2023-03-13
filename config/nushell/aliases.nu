# Ls aliases

export alias ll = exa -lhgF --git --icons
export alias tree = exa -T --color=always --git-ignore --icons

# Git aliases

export alias gb = git branch
export alias gcb = git checkout -b
export alias gco = git checkout

export alias gpl = git pull
export alias gps = git push
export alias gpr = git pull --rebase
export alias gf = git fetch

export alias gcm = git commit -m

export def gac [] {
    git add -A
    git commit
}

export def gacm [commit:string] {
    git add -A
    git commit -m $commit
}

export def gacp [] {
    git add -A
    git commit
    git push
}

export def guc [] {
    git add -u
    git commit
}

export def gucm [commit:string] {
    git add -u
    git commit -m $commit
}

export def gucp [] {
    git add -u
    git commit
    git push
}

export alias gcp = git cherry-pick
export alias gcpno = git cherry-pick --no-commit

export alias gsh = git show
export alias gshh = git show --pretty=fuller
export alias gshhh = git show --pretty=fuller --stat

export alias gd = git diff

export alias gs = git status
export alias gss = git status -s

export alias glog = git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

# Command aliases

export alias cat = bat
export alias vim = hx
export alias tmux = zellij
export alias du = dust
export alias find = fd

# Pacman aliases

export alias unlock = sudo rm /var/lib/pacman/db.lck
export alias cleanup = ame clean --noconfirm