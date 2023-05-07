# Enable multilib

sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Update system

sudo pacman -Syu --noconfirm

# Install packages

sudo pacman -S --noconfirm --needed base-devel git

# Install AUR helper

git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin

cd /tmp/yay-bin

makepkg -si --noconfirm

cd -

rm -rf /tmp/yay-bin

# Install flatpak

sudo pacman -S --noconfirm --needed flatpak

# Add repositories

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install packages

sudo pacman -S --noconfirm --needed wine gnome-tweaks zoxide bat exa helix starship

sudo pacman -S --noconfirm --needed gst-libav gst-plugins-{bad,base,good,ugly} gstreamer-vaapi gst-plugin-pipewire

yay -S --noconfirm --needed gst-plugin-libde265 gst-plugins-openh264

yay -S --noconfirm --needed adw-gtk3 visual-studio-code-bin

flatpak install flathub -y --noninteractive < flatpak.txt
