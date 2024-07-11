#!/usr/bin/env bash

# Switch to a temporary directory
cdtmp() {
	cd $(mktemp -d)
}

# http://cheat.sh
cheat() {
	curl "cheat.sh/$1"
}

command_exists() {
	local command_check=$1

	if command -v "$command_check" &>/dev/null; then
		return 0
	fi

	return 1
}

mvcd() {
	# Move a file or directory to a new directory and cd into it
	local cwd=$(pwd)
	local newcwd=$1

	cd ..
	mv "$cwd" "$newcwd"
	cd "$newcwd"
	pwd
}

edit() {
	# Edit a file with the default editor
	local file=$(find . -type f | fzf) && ${EDITOR:-nvim} "$file"
}

kproc() {
	# Kill a process by name
	local pid=$(ps -ef | sed 1d | fzf | awk '{print $2}')
	if [ -n "$pid" ]; then
		kill -9 "$pid"
	fi
}

fbump() {
  flatpak list --app --columns=application > "$DOTS_DIR/installed_flatpaks.txt"
}
