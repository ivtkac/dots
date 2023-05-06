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

