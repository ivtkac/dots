#!/bin/bash

CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Print usage information
usage() {
  cat <<-EOF
	Usage: $(basename "$0") [OPTION…]

	Installs dotfiles.

	Options:
    -f, --force             Overwrite existing files
    -b, --backup            Backup existing files
    -s, --skip              Skip existing files

	  -h, --help              Display this help
	EOF
}

# Print an error message and exit with status 1
die() {
  echo "$@" >&2
  exit 1
}

# Create a symbolink link with force option
force_install() {
  source_path=$1
  target_path=$2

  ln -sf "$source_path" "$target_path"
  echo "Successfully installed $target_path"
}

# Backup existing files and create a symbolic link
backup_files() {
  source_path=$1
  target_path=$2

  mv "$target_path" "$target_path.bak"
  echo "Backed up existing file: $target_path"
  force_install "$source_path" "$target_path"
}


# Skip installation if the file already exists
skip_install() {
  source_path=$1
  target_path=$2

  if [ -e "$target_path" ]; then
    echo "Skipepd existing file: $target_path"
  else
    force_install "$source_path" "$target_path"
  fi
}

# Install files in the specified directory
install_files() {
  source_dir="$1"
  target_dir="$2"
  exclude_files=("$3")

  mkdir -p "$target_dir"

  shopt -s dotglob

  for file in "$source_dir"/*; do
    source_path="$file"
    target_path="$target_dir/$(basename "$file")"

    excluded=0
    for exclude_file in "${exclude_files[@]}"; do
      if [ "$(basename "$file")" = "$exclude_file" ]; then
        excluded=1
      fi
    done

    [[ "$excluded" ]] && continue
   

    if [ -e "$target_path" ]; then
      [[ "$SKIP" ]] && skip_install "$source_path" "$target_path"
      [[ "$BACKUP" ]] && backup_files "$source_path" "$target_path"
      [[ "$FORCE" ]] && force_install "$source_path" "$target_path"
    else
      skip_install "$source_path" "$target_path"
    fi
  done
}

install_dotfiles() {
  excluded_files=("README.md" "install.sh" ".git")
  install_files "$DOTFILES_DIR/.config" "$CONFIG_DIR"
  install_files "$DOTFILES_DIR" "$HOME" "${excluded_files[@]}"
}

ARGS=$(getopt -o fbsd:h --long force,backup,skip,directory:,help -n "$0" -- "$@")
eval set -- "$ARGS"

while true; do
  case "$1" in
    -f|--force)
      FORCE=1
      shift
      ;;
    -b|--backup)
      BACKUP=1
      shift
      ;;
    -s|--skip)
      SKIP=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    *)
      die "Internal error!"
      ;;
  esac
done

install_dotfiles
