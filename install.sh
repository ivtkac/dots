#!/bin/bash

CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}


usage() {
  cat <<-EOF
	Usage: $(basename $0) [OPTION…]

	Installs dotfiles.

	Options:
    -f, --force             Overwrite existing files
    -b, --backup            Backup existing files
    -s, --skip              Skip existing files

	  -h, --help              Display this help
	EOF
}

die() {
  echo "$@" >&2
  exit 1
}

force_install() {
  local source_path=$1
  local target_path=$2

  ln -sf "$source_path" "$target_path"
  echo "Successfully installed $target_path"
}

backup_files() {
  local source_path=$1
  local target_path=$2

  mv "$target_path" "$target_path.bak"
  echo "Backed up existing file: $target_path"
  force_install "$source_path" "$target_path"
}

skip_install() {
  local target_path=$1

  echo "Skipped existing file: $target_path"
}


install_dotfiles() {
  local source_dir=$1
  local target_dir=$2

  mkdir -p "$target_dir"

  files=( "$source_dir"/.* "$source_dir"/*)

  for file in "$files"; do
    [ "$file" = "$source_dir/." -o "$file" = "$source_dir/.." ] && continue

    source_path="$(pwd)/$file"
    target_path="$target_dir/$(basename "$file")"

    if [ -e "$target_path" ]; then
      [[ "$SKIP" ]] && skip_install "$target_path"
      [[ "$BACKUP" ]] && backup_files "$source_path" "$target_path"
      [[ "$FORCE" ]] && force_install "$source_path" "$target_path"
    else
      force_install "$source_path" "$target_path"
    fi
  done
}

while getopts ":fbsh" opt; do
  case $opt in
    f|force)
      FORCE=1
      shift
      ;;
    b|backup)
      BACKUP=1
      shift
      ;;
    s|skip)
      SKIP=1
      shift
      ;;
    h|help)
      usage
      exit 0
      ;;
    \?)
      die "Invalid option: -$OPTARG"
      ;;
  esac
done

install_dotfiles
