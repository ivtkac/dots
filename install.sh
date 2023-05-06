#!/usr/bin/env bash

# Install from home to ~/

for file in home/*; do
    ln -s $PWD/$file ~/.$(basename $file)
    echo "Successfully installed ~/.$(basename $file)"
done


# Install from config to ~/.config

mkdir -p ~/.config

for file in config/*; do
    ln -s $PWD/$file ~/.config/$(basename $file)
    echo "Successfully installed ~/.config/$(basename $file)"
done

# Prompt for OS-specific scripts if press yes then execute

read -p "Do you want to install OS-specific scripts? [y/N] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [[ $(hostname) == "arch" ]]; then
        for file in scripts/arch/*; do
            bash $PWD/$file
        done
    elif [[ $(hostname) == "fedora" ]]; then
        for file in scripts/fedora/*; do
            bash $PWD/$file
        done
    fi
fi