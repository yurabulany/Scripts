#!/bin/bash

# variables

# update packages list
sudo dnf update -y

# array with the packages needed to install
packages=(wget git neofetch htop mpv vim neovim vifm steam firefox thunderbird i3 i3lock redshift gxkb picom feh nitrogen dunst fish calibre transmission polybar zathura arandr j4-dmenu-desktop flameshot)

# command to install the packages from the array above
sudo dnf install -y ${packages[@]}

# installing codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group -y upgrade --with-optional Multimedia

# add fusion free and non-free repos
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# add flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#install flatpak apps
flatpak install -y flathub org.telegram.desktop
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub com.github.johnfactotum.Foliate
flatpak install -y flathub com.viber.Viber
flatpak install -y flathub io.github.shiftey.Desktop
flatpak install -y flathub com.github.hluk.copyq

# adding config files
cd ~/.config
git clone https://github.com/yurabulany/i3.git
git clone https://github.com/yurabulany/gxkb.git
git clone https://github.com/yurabulany/picom.git
git clone https://github.com/yurabulany/dunst.git



