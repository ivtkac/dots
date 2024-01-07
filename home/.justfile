# List all
default:
	just --list

# Update system
update:
	sudo pacman -Syu

# Remove unused packages
cleanup:
	sudo pacman -Rsn $(pacman -Qqdt)

# Detecting more unneeded packages
unneeded:
	sudo pacman -Rsu --print $(pacman -Qqd)

# List packages with their optional dependencies
list-packages:
	pacman -Qei | sed '/^[^NO ]/d;/None$/d' | awk 'BEGIN{RS=ORS="\n\n";FS=OFS="\n\\S"} /Optional Deps/ {print $1"\nO"$2}'

# Browse all installed packages
browse-installed:
	pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'

# Browse all packages
browse-packages:
	pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse

# Identity files not owned by any package
notowned-packages:
	find /etc /usr /opt | LC_ALL=C pacman -Qqo - 2>&1 >&- >/dev/null | cut -d ' ' -f 5-
	
