#!/usr/bin/env bash

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
THIS=${0##*/}

for file in $DIR/config/*
do
  if [[ -d $file ]] && [[ $file != *"${THIS}" ]]; then
    bn=`basename $file`
    ln -sfv $file "${HOME}/.config/${bn}"
  fi
done

if [[ -d ~/.bashrc ]]; then
  mv ~/.bashrc ~/.bashrc.old
  ln -sfv "$DIR/.bashrc" "${HOME}/.bashrc"
fi

if [[ -d ~/.tmux.conf ]]; then
  mv ~/.tmux.conf ~/.tmux.conf.old
  ln -sfv "$DIR/.tmux.conf" "${HOME}/.tmux.conf"
fi
