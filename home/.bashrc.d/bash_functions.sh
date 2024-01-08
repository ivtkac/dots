#!/usr/bin/env bash

# Switch to a temporary directory
cdtmp() {
  cd $(mktemp -d)
}

tere() {
  local result=$(command tere -m alt-enter:Exit "$@")
  [ -n "$result" ] && cd -- "$result"
}

# http://cheat.sh
cheat() {
  curl "cheat.sh/$1"
}
