#!/usr/bin/env bash

zrunf() {
  zellij run --floating -- "$@"
}

zrun() {
  zellij run -- "$@"
}

zedit() {
  zellij edit "$1"
}
