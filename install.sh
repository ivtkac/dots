#!/usr/bin/bash

stow --target "$HOME" .

flatpaks_to_install=$(cat installed_flatpaks.txt)

read -r "Do you want to install flatpak applications? (y/n) " choice
case "$choice" in
y | Y)
  echo "Installing flatpaks..."

  for flatpak in $flatpaks_to_install; do
    if ! flatpak list --app | grep -q "$flatpak"; then
      echo "Installing $flatpak..."
      flatpak install -y "$flatpak"
    fi
  done

  echo "Flatpak installations complete!"
  ;;
*) ;;
esac
