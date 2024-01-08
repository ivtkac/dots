#!/usr/bin/env bash

CONFIG_DIR=${XDG_CONFIG_DIR:-$HOME/.config}

install_files() {
  source=$1
  destination=$2

  mkdir -p "$destination"

  shopt -s dotglob

  for file in "$source"/*; do
    filename=$(basename "$file")
    
    echo "$file -> $destination/$filename"
    ln -sf "$file" "$destination/$filename"
  done
}

install_dots() {
  install_files "$PWD/home" "$HOME"
  install_files "$PWD/config" "$CONFIG_DIR"
  install_files "$PWD/local" "$HOME/.local"
}

install_dots
