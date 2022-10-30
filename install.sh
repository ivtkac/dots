#!/usr/bin/env bash

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
THIS=${0##*/}

for file in $DIR/*
do
  if [[ -f $file ]] && [[ $file != *"${THIS}" ]]; then
    bn=`basename $file`
    ln -sfv $file "${HOME}/.${bn}"
  elif [[ -d $file ]] && [[ $file != *"${THIS}" ]]; then
    bn=`basename $file`
    ln -sfv $file "${HOME}/.${bn}"
  fi
done