# Bat aliases
abbr -a cat "bat -pp"
abbr -a b "bat -pp"

# Ripgrep aliases
abbr -a grep "rg"
abbr -a egrep "rg"
abbr -a fgrep "rg -F"
abbr -a xzgrep "rg -z"
abbr -a xzegrep "rg -z"
abbr -a xzfgrep "rg -z -F"

# Good aliases
abbr -a f "fzf"

abbr -a l "eza --sort=size --all --header --long --group-directories-first --icons always --git -- $argv"

abbr -a zj "zellij"

abbr -a v "nvim"
abbr -a vi "nvim"
abbr -a vim "nvim"

abbr -a md "python -m textual"

abbr -a code "zeditor"
abbr -a hx "helix"

abbr -a neo "fastfetch"

abbr -a less "less -R"

abbr -a c "wl-copy"

abbr -a upd "sudo pacman -Syuv"
abbr -a cpwd "pwd | tr -d '\n' | wl-copy"

# Help aliases
abbr -a help "tldr"

# Tree aliases
abbr -a tree "tree -C"

# Tmux aliases
abbr -a tmux "zellij"

# Navigation aliases
abbr -a cd "to"
abbr -a "-" "cd -"
abbr -a ".." "cd .."
abbr -a "..." "cd ../.."
abbr -a "...." "cd ../../.."

# Git aliases
abbr -a ,a "git add"
abbr -a ,ad "git add ."
abbr -a ,ap "git add --patch"
abbr -a ,r "git restore"
abbr -a ,rs "git restore --staged"
abbr -a ,re "git reset"
abbr -a ,c "git commit"
abbr -a ,ca "git commit --amend"
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

abbr -a gi "gh issue"
abbr -a gil "gh issue list"
abbr -a giv "gh issue view"
abbr -a gr "gh pr"
abbr -a grl "gh pr list"
abbr -a grv "gh pr view"
abbr -a grc "gh pr checkout"
abbr -a gb "gh browse"
