set -gx GPG_TTY (tty)

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_RUNTIME_DIR /run/user/(id -u)

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path $XDG_CACHE_HOME/.bun/bin

set -gx HISTSIZE 10000
set -gx SAVEHIST 10000

set -gx EDITOR nvim
set -gx ALTERNATE_EDITOR zeditor
set -gx VISUAL $EDITOR

set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx PASSWORD_STORE_DIR $XDG_DATA_HOME/pass

set -gx CARGO_HOME $XDG_DATA_HOME/cargo
fish_add_path $CARGO_HOME/bin

set -gx MANPAGER 'nvim +Man!'

set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx RYE_HOME $XDG_CACHE_HOME/rye

set -gx PNPM_HOME $XDG_DATA_HOME/pnpm
fish_add_path $PNPM_HOME

# Set up custom XDG directories
set -gx XDG_PROJECTS_DIR $HOME/Projects
set -gx XDG_GAMES_DIR $XDG_DATA_HOME/games
set -gx DOTS_DIR $XDG_PROJECTS_DIR/dotfiles

# Custom fzf
