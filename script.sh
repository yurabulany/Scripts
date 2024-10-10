#!/bin/bash
# update packages list
sudo dnf update

# array with the packages needed to install
packages=(wget git neofetch htop mpv neovim vifm steam firefox thunderbird i3 picom feh dunst fish calibre transmission polybar zathura)

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

# adding config files for i3 
mkdir ~/.config/i3
cd ~/.config/i3
git clone 

# adding config files for dunst 
mkdir ~/.config/dunst
cd ~/.config/dunst
git clone 
#
# adding config files for picom 
mkdir ~/.config/picom
cd ~/.config/picom
git clone 
