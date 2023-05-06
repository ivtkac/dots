# Upgrade system 

sudo dnf upgrade --refresh --best --allowerasing -y

flatpak update -y

sudo dnf autoremove -y

sudo dnf clean all

flatpak uninstall --unused -y

# Add repositories

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf copr enable varlad/helix

sudo dnf copr enable nickavem/adw-gtk3

sudo dnf copr atim/starship

# Install packages

sudo dnf install wine exa helix starship gnome-tweaks adw-gtk3 zoxide bat -y

sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y

sudo dnf install lame\* --exclude=lame-devel -y

sudo dnf group upgrade --with-optional Multimedia -y

flatpak install flathub -y --noninteractive < flatpak.txt

# Install Visual Studio Code

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf check-update -y

sudo dnf install code -y