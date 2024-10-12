#!/bin/bash

# variables

# update packages list
sudo dnf update -y

# array with the packages needed to install
packages=(wget git neofetch htop mpv vim neovim vifm fzf steam firefox thunderbird i3 i3lock redshift gxkb picom feh nitrogen dunst fish calibre transmission polybar zathura arandr j4-dmenu-desktop tmux flameshot darktable python ripgrep)

# command to install the packages from the array above
sudo dnf install -y ${packages[@]}

# add fusion free and non-free repos
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# installing codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group -y upgrade --with-optional Multimedia

## flatpak section
# add flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# array with flatpak packages
flatpak_packages = (org.telegram.desktop org.onlyoffice.desktopeditors com.github.johnfactotum.Foliate com.viber.Viber io.github.shiftey.Desktop com.github.hluk.copyq)

#install flatpak apps from the array above
flatpak install -y ${flatpak_packages[@]}

## configs section
# adding config files
cd ~/.config
git clone https://github.com/yurabulany/i3.git
git clone https://github.com/yurabulany/gxkb.git
git clone https://github.com/yurabulany/picom.git
git clone https://github.com/yurabulany/dunst.git
git clone https://github.com/yurabulany/vifm.git
git clone https://github.com/yurabulany/fish.git
git clone https://github.com/yurabulany/tmux.git
git clone https://github.com/yurabulany/mpv.git

## fish section
# make fish the default shell
sudo dnf install -y util-linux-user
chsh -s /usr/bin/fish

# adding powerline to fish
curl -L https://get.oh-my.fish | fish
sudo dnf install -y powerline-fonts
omf install bobthefish

## lazygit section
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit

reboot
