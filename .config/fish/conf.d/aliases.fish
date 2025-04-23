# Onechar shortcuts
abbr -a b "bat -pp"
abbr -a v nvim
abbr -a f fzf
abbr -a t tmux
abbr -a g git
abbr -a l "eza --sort=size --all --header --long --group-directories-first --icons always --git -- $argv"

abbr -a please sudo

# ls aliases
abbr -a ls 'ls --color=auto'
abbr -a la 'ls -a'
abbr -a l1 'ls -1'
abbr -a ll 'ls -lAh'

# Editors
abbr -a zj zellij
abbr -a ze zellij

abbr -a hx helix
abbr -a md 'python -m textual'

abbr -a vi nvim
abbr -a vim nvim
abbr -a code nvim

abbr -a neofetch fastfetch

# Colors
abbr -a grep 'grep --color=auto'
abbr -a less "less -R"

# Essentials
abbr -a upd "sudo pacman -Syuv"
abbr -a cpwd "pwd | tr -d '\n' | wl-copy"

# Easy navigate
abbr -a cd to

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

abbr -a vm "vboxmanage startvm OracleLinux 9.5 --type headless 2>/dev/null; ssh vm"

abbr -a chownme "sudo chown -R $USER:$USER"

abbr -a chx "chmod +x"

abbr -a fstor "sudo find / -type f -exec du -h {} + | sort -hr | head"
abbr -a ducwd "du -sh * .[!.]* | sort -h"

abbr -a lsdof "sudo lsof +L1"

abbr -a psa "ps aux"
abbr -a psf "ps auxf"
abbr -a psmem "ps -eo pid,ppid,cmd,rss,stat,%mem,%cpu --sort=-%mem | head"

abbr -a ff "find . -type f -iname"
abbr -a fdir "find . -type d -iname"

abbr -a batcheck "upower -i $(upower -e | grep BAT)"

abbr -a cln "sudo pacman -Rns $(pacman -Qtdq)"
