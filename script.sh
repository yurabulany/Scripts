#!/bin/bash
# update packages list
sudo dnf update

# array with the packages needed to install
packages=(wget git neofetch htop mpv neovim vifm steam firefox thunderbird i3 redshift gxkb picom feh nitrogen dunst fish calibre transmission polybar zathuraarandr j4-dmenu-desktop flameshot)

# command to install the packages from the array above
sudo dnf install -y "${packages[@]}"

# installing codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# add fusion free and non-free repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# add flatpak repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#install flatpak apps
flatpak install flathub org.telegram.desktop
flatpak install flathub org.onlyoffice.desktopeditors
flatpak install flathub com.github.johnfactotum.Foliate
flatpak install flathub com.viber.Viber
flatpak install flathub io.github.shiftey.Desktop
flatpak install flathub com.github.hluk.copyq


# adding config files for i3 
mkdir ~/.config/i3
cd ~/.config/i3
git clone https://github.com/yurabulany/i3-window-manager.git

# adding config files for dunst 
mkdir ~/.config/dunst
cd ~/.config/dunst
git clone https://github.com/yurabulany/Dunst-config.git
#
# adding config files for picom 
mkdir ~/.config/picom
cd ~/.config/picom
git clone https://github.com/yurabulany/Picom.git

# adding config files for gxkb 
mkdir ~/.config/gxkb
cd ~/.config/gxkb
git clone https://github.com/yurabulany/gxkb.git
