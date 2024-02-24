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
