#!/bin/bash

# variables
# time variable
TIME_FOR_SLEEP = 2

# update packages list
sudo dnf update -y

# array with the packages needed to install
packages=(wget git neofetch htop mpv vim neovim vifm steam firefox thunderbird i3 redshift gxkb picom feh nitrogen dunst fish calibre transmission polybar zathura arandr j4-dmenu-desktop flameshot)

# command to install the packages from the array above
echo "Will now install some apps"
sudo dnf install -y ${packages[@]}

# installing codecs
echo "Will install codecs now"
sleep $TIME_FOR_SLEEP
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group -y upgrade --with-optional Multimedia

# add fusion free and non-free repos
echo "Will install fusion repos now"
sleep $TIME_FOR_SLEEP
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# add flatpak repo
echo "Will add flatpak repo now"
sleep $TIME_FOR_SLEEP
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#install flatpak apps
sleep $TIME_FOR_SLEEP
echo "Will install flatpak apps now"
flatpak install flathub org.telegram.desktop
flatpak install flathub org.onlyoffice.desktopeditors
flatpak install flathub com.github.johnfactotum.Foliate
flatpak install flathub com.viber.Viber
flatpak install flathub io.github.shiftey.Desktop
flatpak install flathub com.github.hluk.copyq

# adding config files for i3 
sleep $TIME_FOR_SLEEP
echo "Will add the directory for i3 and clone config into it"
mkdir ~/.config/i3
cd ~/.config/i3
git clone https://github.com/yurabulany/i3-window-manager.git

# adding config files for dunst 
echo "Will add the directory for dunst and clone config into it"
mkdir ~/.config/dunst
cd ~/.config/dunst
git clone https://github.com/yurabulany/Dunst-config.git

# adding config files for picom 
echo "Will add the directory for picom and clone config into it"
mkdir ~/.config/picom
cd ~/.config/picom
git clone https://github.com/yurabulany/Picom.git

# adding config files for gxkb 
echo "Will add the directory for gxkb and clone config into it"
mkdir ~/.config/gxkb
cd ~/.config/gxkb
git clone https://github.com/yurabulany/gxkb.git
