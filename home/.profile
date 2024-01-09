#!/usr/bin/env bash

export EDITOR="helix"
export ALTERNATE_EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"

export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

. "$CARGO_HOME/.cargo/env"
