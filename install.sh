#!/usr/bin/env bash

CONFIG_DIR=${XDG_CONFIG_DIR:-$HOME/.config}

install_files() {
  source=$1
  destination=$2
  exclude=$3

  shopt -s dotglob

  for file in "$source"/*; do
    filename=$(basename "$file")
    
    if [ -z "$exclude" ] || { [ -n "$exclude" ] && [[ ! $filename =~ $exclude ]]; }; then
      echo "$file -> $destination/$filename"
      ln -sf "$file" "$destination/$filename"
    fi
  done
}

install_dots() {
  dir=$(pwd)

  install_files "$dir/home/.config" "$CONFIG_DIR"
  install_files "$dir/home" "$HOME" ".config"
}

install_dots
