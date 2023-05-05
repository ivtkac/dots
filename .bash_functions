#!/bin/bash

function flatclean() {
  apps=$(flatpak list --app --columns=application)

  for folder in ~/.var/app/*/
  do

  folder_name=$(basename $folder)

  if [[ ! $apps =~ $folder_name ]]; then
    rm -rf "$folder"
  fi
  done
}

