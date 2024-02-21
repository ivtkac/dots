#!/usr/bin/env bash

# Switch to a temporary directory
cdtmp() {
  cd $(mktemp -d)
}

# http://cheat.sh
cheat() {
  curl "cheat.sh/$1"
}
