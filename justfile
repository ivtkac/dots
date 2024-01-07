# List all
default:
	just --list

yay:
	#!/usr/bin/env bash
	[ -f /tmp/yay-bin ] &&  rm -rf /tmp/yay-bin

	git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
	cd /tmp/yay-bin && makepkg -si --noconfirm

base:
	# manpages
	
