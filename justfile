# List all
default:
	just --list

# Install AUR helper
yay:
	#!/usr/bin/env bash
	[ -f /tmp/yay-bin ] &&  rm -rf /tmp/yay-bin

	git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
	cd /tmp/yay-bin && makepkg -si --noconfirm

core: yay base fonts media

# Base packages
base:
	# manpages
	yay -S man-pages man-db --noconfirm --needed

	# sound
	yay -S pipewire-alsa pipewire-pulse wireplumber alsa-utils alsa-firmware --noconfirm --needed

	# xdg
	yay -S xdg-utils xdg-user-dirs xdg-user-dirs-gtk --noconfirm --needed

	# compressions
	yay -S zip unzip --noconfirm --needed

	# utils
	yay -S nano zsync rsync less dialog curl tracker bash-completion --noconfirm --needed

	# network 
	yay -S networkmanager bluez --noconfirm --needed

# Configure fonts
fonts:
	yay -S ttf-dejavu noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols \
		ttf-meslo-nerd gnu-free-fonts ttf-liberation cantarell-fonts --noconfirm --needed

# Configure media
media:
	yay -S ffmpeg gst-plugins-{bad,base,good,ugly} gstreamer-vaapi gst-plugin-pipewire gst-libav --noconfirm --needed

# Install needed packages for pinters
printers:
	yay -S cups system-config-printer cups-pk-helper --noconfirm --needed

# Configure nvidia
nvidia:
	yay -S nvidia --noconfirm --needed

# Install dev packages
dev:
	# Languages
	sudo pacman -S go rust python nodejs npm pnpm --noconfirm --needed

	# CLIs
	sudo pacman -S helix bat eza starship zoxide zellij --noconfirm --needed

	# VSCode
	yay -S visual-studio-code-bin --noconfirm --needed

	# Upgrade tool
	yay -S topgrade-bin --needed --noconfirm

	# LSps
	yay -S typescript-language-server rust-analyzer --noconfirm --needed

	# Containers
	yay -S docker podman kubectl --noconfirm --needed

# Configure docker
docker:
	sudo pacman -S docker --noconfirm --needed
	sudo systemctl enable --now docker
	sudo usermod -aG docker $USER

	sudo pacman -S docker-compose --noconfirm --needed

# Laptop utils
laptop:
	yay -S power-profiles-daemon switcheroo-control --noconfirm --needed

# Configure GNOME DE
configure-gnome:
	# sudo pacman -Rns gnome-music gnome-calendar gnome-calculator epiphany gnome-clocks gnome-contacts gnome-tour gnome-text-editor gnome-weather gnome-characters gnome-maps sushi totem

	sudo pacman -S gpsd --noconfirm --needed
	sudo systemctl enable gpsd

	gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
	gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
	flatpak install re.sonny.Commit com.mattjakeman.ExtensionManager org.telegram.desktop org.mozilla.firefox com.discordapp.Discord \
		org.nickvision.tubeconverter org.gnome.World.Secrets org.gnome.World.PikaBackup org.gnome.Weather org.gnome.TextEditor org.gnome.Snapshot \
		org.gnome.NautilusPreviewer org.gnome.Maps org.gnome.Loupe org.gnome.Geary org.gnome.Evince org.gnome.clocks org.gnome.Epiphany org.gnome.Calendar \
		org.gnome.Calculator io.bassi.Amberol com.github.marhkb.Pods dev.geopjr.Tuba org.gnome.Contacts	com.spotify.Client -y
