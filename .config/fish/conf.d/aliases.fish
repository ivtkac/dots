# Eza for ls
alias ll='eza -l --icons=auto --group-directories-first' 2>/dev/null
alias l.='eza -d .*' 2>/dev/null
alias ls='eza' 2>/dev/null
alias l1='eza -1'
alias la='eza -a --icons=auto --group-directories-first' 2>/dev/null

# Ripgrep for grep
alias grep='rg' 2>/dev/null
alias egrep='rg' 2>/dev/null
alias fgrep='rg -F' 2>/dev/null
alias xzgrep='rg -z' 2>/dev/null
alias xzegrep='rg -z' 2>/dev/null
alias xzfgrep='rg -z -F' 2>/dev/null

# Zoxide is handling cd
alias cd='cd' 2>/dev/null

# Fd for find
alias find='fd' 2>/dev/null

# Bat for cat
alias cat="bat --style=plain --pager=never" 2>/dev/null

# Fastfetch for neofetch
alias neofetch="fastfetch" 2>/dev/null

# Helix for all editors
alias hx="helix" 2>/dev/null
alias vi="helix" 2>/dev/null
alias vim="helix" 2>/dev/null
alias nvim="helix" 2>/dev/null
alias nano="helix" 2>/dev/null
alias code="helix" 2>/dev/null

# Zellij for tmux
alias tmux="zellij" 2>/dev/null

# Aliases
abbr -a please sudo

# Essentials
abbr -a upd "sudo pacman -Syuv"
abbr -a cpwd "pwd | tr -d '\n' | wl-copy"

# Git aliases
abbr -a ,a "git add"
abbr -a ,ad "git add ."
abbr -a ,ap "git add --patch"
abbr -a ,r "git restore"
abbr -a ,rs "git restore --staged"
abbr -a ,re "git reset"
abbr -a ,c "git commit"
abbr -a ,ca "git commit --amend"
abbr -a ,co "git checkout"
abbr -a ,cb "git checkout -b"
abbr -a ,d "git diff"
abbr -a ,dc "git diff --cached"
abbr -a ,m "git merge"
abbr -a ,s "git status"
abbr -a ,p "git push"
abbr -a ,pf "git push --force-with-lease"
abbr -a ,pu "git pull"
abbr -a ,f "git fetch"
abbr -a ,fu "git fetch upstream"
abbr -a ,sw "git switch"
abbr -a ,sc "git switch -c"
abbr -a ,b "git branch"
abbr -a ,l "git log"
abbr -a ,st "git stash"
abbr -a ,cp "git cherry-pick"
abbr -a ,cpno "git cherry-pick --no-commit"

abbr -a gi "gh issue"
abbr -a gil "gh issue list"
abbr -a giv "gh issue view"
abbr -a gpr "gh pr"
abbr -a grl "gh pr list"
abbr -a grv "gh pr view"
abbr -a grc "gh pr checkout"
abbr -a gbr "gh browse"
