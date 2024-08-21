abbr -a cmv "command -v"

abbr -a cp "cp -iv"
abbr -a mv "mv -iv"
abbr -a rm "rm -iv"

# Bat aliases
abbr -a cat "bat -pp"
abbr -a b "bat -pp"

# Ls aliases
abbr -a ls "eza --icons"
abbr -a "l." "eza -d .* --icons"
abbr -a ll "eza -l --icons=auto --group-directories-first"
abbr -a l1 "eza -1 --icons"
abbr -a la "eza -a --icons"
abbr -a l "eza -lah --icons"

# Ripgrep aliases
abbr -a grep "rg"
abbr -a egrep "rg"
abbr -a fgrep "rg -F"
abbr -a xzgrep "rg -z"
abbr -a xzegrep "rg -z"
abbr -a xzfgrep "rg -z -F"

# Find aliases
abbr -a find "fd"
abbr -a zj "zellij"

# Good aliases
abbr -a v "nvim"
abbr -a vi "nvim"
abbr -a vim "nvim"

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
abbr -a g "git"
abbr -a ga "git add"
abbr -a gad "git add ."
abbr -a gap "git add --patch"
abbr -a gr "git restore"
abbr -a grs "git restore --staged"
abbr -a gre "git reset"
abbr -a gc "git commit"
abbr -a gca "git commit --amend"
abbr -a "gac" "git add . && git commit"
abbr -a gd "git diff"
abbr -a gdc "git diff --cached"
abbr -a gm "git merge"
abbr -a gs "git status"
abbr -a gp "git push"
abbr -a gpf "git push --force-with-lease"
abbr -a gpu "git pull"
abbr -a gf "git fetch"
abbr -a gfu "git fetch upstream"
abbr -a gsw "git switch"
abbr -a gsc "git switch -c"
abbr -a gb "git branch"
abbr -a gl "git log"


