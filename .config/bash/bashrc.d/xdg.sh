# XDG base directories
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$UID}

# Hardcode the non-xdg compilant files
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$PATH:$CARGO_HOME/bin"

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export RYE_HOME="$XDG_CACHE_HOME/rye"

export HISTFILE="$XDG_DATA_HOME/bash/history"

if [ -f "$HOME/.cache/rye/env" ]; then
    . "$HOME/.cache/rye/env"
fi

export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PATH:$PNPM_HOME"

export CUDE_CACHE_PATH="$XDG_CACHE_HOME/nv"

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/doker
