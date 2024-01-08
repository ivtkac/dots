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
	sudo pacman -S gpsd --noconfirm --needed
	
	sudo pacman -S webp-pixbuf-loader --noconfirm --needed
	sudo pacman -S ffmpegthumbnailer --noconfirm --needed

	sudo pacman -S geary --noconfirm --needed
	sudo pacman -S celluloid --noconfirm --needed

	yay -S commit --noconfirm --needed

	sudo pacman -S discord --noconfirm --needed


	yay -S amberol --needed --noconfirm

	sudo pacman -S secrets --needed --noconfirm

	sudo pacman -S spotifyd --needed --noconfirm

	yay -S pods --needed --noconfirm

	yay -S paper-plane --needed --noconfirm

	sudo pacman -S spotify-launcher --needed --noconfirm

	gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
	gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true

	xdg-mime default org.gnome.Nautilus.desktop inode/directory

	sudo loginctl enable-linger $USER

	systemctl --user enable spotifyd.service

	sudo systemctl enable gpsd

	# Remove packages
	sudo pacman -Rns malcontent
	sudo pacman -Rns gnome-software
	sudo pacman -Rns flatpak
	sudo pacman -Rns totem
