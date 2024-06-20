set -x GPG_TTY (tty)

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_RUNTIME_DIR /run/user/(id -u)

set -x PATH $HOME/.local/bin $PATH

set -x EDITOR nvim
set -x ALTERNATE_EDITOR helix

set -x VISUAL $EDITOR

set -x INPUTRC $XDG_CONFIG_HOME/readline/inputrc

set -x GNUPGHOME $XDG_DATA_HOME/gnupg

set -x PASSWORD_STORE_DIR $XDG_DATA_HOME/pass

set -x CARGO_HOME $XDG_DATA_HOME/cargo

set -x MANPAGER 'nvim +Man!'

set -x RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config