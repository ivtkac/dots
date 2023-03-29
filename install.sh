#!/usr/bin/env bash

# Sure that folder is exists
mkdir -p ~/.config

# Unlink all existing files
links=$(find ~/.config -type l)

for linkfile in "$links"; do
  unlink "$linkfile"
done

# Link all dotfiles to those in this repo.
for rcfile in "$PWD/config"; do
  ln -fsnv "$rcfile" "~/.config/${rcfile:t}"
done

# Install bash scripts
for bashfile in "$PWD/.bash*"; do
  ln -fsnv "$PWD/$bashfile" "~/${bashfile:t}"
done

# Install arch packages
pacman -S --needed $installable_packages
