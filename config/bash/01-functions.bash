#!/usr/bin/bash

# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Get the first avaiable command from the list
get_command() {
  for cmd in "$@"; do
    command_exists "$cmd" && echo "$cmd" && return
  done
}

# Go up `n` directories
cd_up() {
  local n=$1
  while [ "$n" -ne 0 ]; do
    cd ..
    n=$((n-1))
  done
}

# Source multiple files
source_files() {
  for file in "$@"; do
    [ -f "$file" ] && . "$file"
  done
}

# Add a directory to PATH if it exists and is not already in PATH
pathadd() {
    [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]] && PATH="${PATH:+$PATH:}$1"
}

# Initialize a command if it exists
init_command() {
    command_exists "$1" && eval "$($2)"
}

# Git diff with bat if available
git_diff() {
    if command_exists 'bat'; then
        git diff --name-only --relative --diff-filter=d | xargs bat --diff
    else
        git diff
    fi
}

# Set editor
set_editor() {
    editor="$(get_command hx helix nvim vim vi nano)"

    if [ "$editor" = 'hx' ]; then
        export HELIX_RUNTIME="$HOME/Projects/helix/runtime"
    elif [ "$editor" != 'hx' ] && [ -d '/usr/lib/helix' ]; then
        pathadd "/usr/lib/helix"
        editor="$(get_command hx $editor)"
    fi
    
    export EDITOR="$editor"
    export VISUAL="$EDITOR"
}

# Create a new directory and navigate into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Quick add, commit, and push
gacp() {
    git add .
    git commit -m "$1"
    git push
}

renameall() {
    for file in *; do
        if ! [[ "$file" =~ ^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\..* ]]; then
            mv "$file" "$(uuidgen).${file##*.}"
            echo "Renamed $file to $(uuidgen).${file##*.}"
        fi
    done
}
