just := just_executable()

default: gnome

core: install_yay base fonts media

vivobook15: gnome-minimal nvidia flatpak dotfiles

install_yay:
    {{just}} clean_yay

    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    cd /tmp/yay-bin && makepkg -si --noconfirm

clean_yay:
    rm -rf /tmp/yay-bin

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


fonts:
    yay -S ttf-dejavu noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols \
        ttf-meslo-nerd gnu-free-fonts ttf-liberation cantarell-fonts --noconfirm --needed

media:
    yay -S ffmpeg gst-plugins-{bad,base,good,ugly} gstreamer-vaapi gst-plugin-pipewire gst-libav --noconfirm --needed

    yay -S gst-plugin-libde265 gst-plugins-openh264 --noconfirm --needed

printers:
    yay -S cups system-config-printer cups-pk-helper --noconfirm --needed

nvidia:
    yay -S nvidia --noconfirm --needed

flatpak:
    yay -S flatpak --noconfirm --needed
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install -y --noninteractive `cat installed_flatpaks.txt | xargs`

dotfiles:
    {{just}} uninstall_dotfiles
    sh install.sh

uninstall_dotfiles:
    sh uninstall.sh

gnome-minimal:
    {{just}} core

    yay -S gnome-shell nautilus gnome-console gnome-tweak-tool gnome-control-center \
        xdg-user-dirs file-roller gnome-keyring gnome-backgrounds gnome-bluetooth \
        gnome-disk-utility gnome-menus xdg-desktop-portal-gnome evolution-data-server --noconfirm --needed
    
    yay -S mutter-performance --noconfirm --needed

plasma-minimal:
    {{just}} core

    yay -S kvantum-qt5 kvantum-theme-materia plasma-desktop konsole ark gwenview kde-gtk-config \
        kdeplasma-addons ksysguard powerdevil spectacle kio-extras kcalc kcron okular \
        dolphin dolphin-plugins sweeper kdeconnect oxygen plasma-nm plasma-pa kate \
        print-manager sddm vlc --noconfirm --needed

gnome:
    {{just}} core

    # network
    yay -S gnome-remote-desktop gnome-user-share --noconfirm --needed

    # password
    yay -S gnome-keyring cracklib --noconfirm --needed
    yay -S gnome-ssh-askpass4-git --noconfirm --needed

    # utilities
    yay -S gnome-disk-utility gnome-system-monitor sushi gnome-software ghostscript zenity --noconfirm --needed    
    yay -S adwdialog-git --noconfirm --needed

    # core
    yay -S gdm gnome-shell gnome-shell-extensions gnome-session gnome-browser-connector xdg-desktop-portal-gnome evolution-data-server mutter gjs --noconfirm --needed

    # common
    yay -S gnome-user-docs yelp rygel webp-pixbuf-loader gdk-pixbuf2 libheif --noconfirm --needed

    # essentials
    yay -S nautilus nautilus-share gnome-console gnome-bluetooth gnome-online-accounts \
        gnome-menus gnome-color-manager gnome-control-center --noconfirm --needed
    
    # appearance
    yay -S gnome-backgrounds gnome-themes-extra adwaita-icon-theme \
        adw-gtk3 --noconfirm --needed

    # laptop goodies
    yay -S power-profiles-daemon switcheroo-control --noconfirm --needed

dev-stuffs:
    yay -S go rust python nodejs npm pnpm --noconfirm --needed
    yay -S helix bat exa starship zoxide zellij --noconfirm --needed
    yay -S visual-studio-code-bin --noconfirm --needed
    yay -S topgrade-bin --noconfirm --needed
    yay -S typescript-language-server prisma-language-server --noconfirm --needed
    yay -S docker podman --noconfirm --needed
