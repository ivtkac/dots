# List all
default:
	just --list

# Update system
update:
	sudo pacman -Syu

# Remove unused packages
cleanup:
	sudo pacman -Rsn $(pacman -Qqdt) 

