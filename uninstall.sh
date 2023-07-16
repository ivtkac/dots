#!/usr/bin/env bash

# Uninstall from ~/
for file in home/*; do
    unlink "$HOME/.$(basename "$file")"
    echo "Successfully uninstalled ~/.$(basename "$file")"
done

# Uninstall from ~/.config

for file in config/*; do
    unlink "$HOME/.config/$(basename "$file")"
    echo "Successfully uninstalled ~/.config/$(basename "$file")"
done