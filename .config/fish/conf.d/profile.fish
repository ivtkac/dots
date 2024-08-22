set -x GPG_TTY (tty)

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_RUNTIME_DIR /run/user/(id -u)

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/nvim/mason/bin

set -x EDITOR nvim
set -x ALTERNATE_EDITOR helix

set -x VISUAL $EDITOR

set -x GNUPGHOME $XDG_DATA_HOME/gnupg

set -x PASSWORD_STORE_DIR $XDG_DATA_HOME/pass

set -x CARGO_HOME $XDG_DATA_HOME/cargo
fish_add_path $CARGO_HOME/bin 

set -x MANPAGER 'nvim +Man!'

set -x RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config

set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

set -x RYE_HOME $XDG_CACHE_HOME/rye

set -x XDG_PROJECTS_DIR $HOME/Projects
set -x XDG_GAMES_DIR $XDG_DATA_HOME/games

set -x DOTS_DIR $XDG_PROJECTS_DIR/dotfiles
