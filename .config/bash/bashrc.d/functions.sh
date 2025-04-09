# Switch to a temporary directory
cdtmp() {
  cd "$(mktemp -d)" || exit
}

# http://cheat.sh
cheat() {
  curl "cheat.sh/$1"
}

# Move a file or directory to a new directory and cd into it
command_exists() {
    command -v "$1" &>/dev/null && return 0 || return 1
}

mvcd() {
  cwd="$(pwd)"
  newcwd=$1

  cd ..
  mv "$cwd" "$newcwd"
  pwd

  unset cwd
  unset newcwd
}

# Edit a file with the default editor
edit() {
  ${EDITOR:-nvim} "$(find . type -f | fzf)"
}

kproc() {
  pid=$(ps -ef | sed 1d | fzf | awk '{print $2}')

  [ -n "$pid" ] && kill -9 "$pid"
  unset pid
}

fbump() {
  flatpak list --app --columns=application > "$DOTS_DIR/installed_flatpaks.txt"
}

yy() {
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"

  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd" || exit
  fi

  rm -f -- "$tmp"

  unset tmp
}

# Exraction file
ex() {
  if [ -f "$1" ]; then
    ext=$(file --mime-type -b "$1")

    case "$ext" in
      application/x-bzip2) bunzip2 "$1" ;;
      application/x-gzip) gunzip "$1" ;;
      application/x-tar) tar xf "$1" ;;
      application/zip) unzip "$1" ;;
      application/x-7z-compressed) 7za x "$1" ;;
      application/x-rar) unrar x "$1" ;;
      application/x-xz) tar xf "$1" ;;
      application/vnd.debian.binary-package) ar x "$1" ;;
      *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Check if the current directory is a git repository
is_git_repo() {
  git rev-parse HEAD >/dev/null 2>&1
}

# git tag
gt() {
  is_git_repo || return
  git tag --sort -version:refname |
    fzf-tmux -m --preview-window top:80% \
      --preview 'git show --color=always {} | head -'$LINES
}

# git status
gs() {
  is_git_repo || return
  git -c color.status=always status --short |
    fzf-tmux -m --preview-window top:80% --ansi --nth 2..,.. \
      --preview 'git diff -- {-1} | diff-so-fancy'
}

# git branch
gb() {
  is_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
    fzf-tmux --ansi -m --tac --preview-window top:80% \
      --header "Current branch: $(git rev-parse --abbrev-ref HEAD)" \
      --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
    sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/##'
}

# git log
gl() {
  is_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
    fzf-tmux --ansi --no-sort --reverse -m \
      --preview-window top:60% \
      --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
    grep -o "[a-f0-9]\{7,\}"
}

# git remote
gr() {
  is_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
    fzf-tmux --tac --preview-window top:80% \
      --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" --remotes={1} | head -200' |
    cut -d$'\t' -f1
}

# git stash
gst() {
  is_git_repo || return
  git stash list | fzf-tmux --reverse -d: --preview 'git show --color=always {1}' |
    cut -d: -f1
}

# checkout GitHub PR
pull() {
  gh pr checkout "$1"
}

# clone a repository and cd into it
gitctl() {
  git clone "$1"
  cd "${1##*/}" || exit
}

# get gitignore for a specific language
gitignore() {
  curl -L -s https://www.gitignore.io/api/"$*" >.gitignore
}

# Preview
batdiff() {
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
}
