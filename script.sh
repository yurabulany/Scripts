#!/bin/bash

# variables

# update packages list
sudo dnf update -y

# array with the packages needed to install
packages=(wget alacritty git neofetch htop mpv vim neovim vifm fzf steam firefox thunderbird i3 i3lock redshift gxkb picom feh nitrogen dunst fish calibre transmission polybar zathura arandr j4-dmenu-desktop tmux flameshot darktable python ripgrep adobe-source-code-pro-fonts)

# command to install the packages from the array above
sudo dnf install -y ${packages[@]}

# add fusion free and non-free repos
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# installing codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group -y upgrade --with-optional Multimedia

## google chrome section
sudo dnf install -y fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

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
git clone https://github.com/yurabulany/alacritty.git
git clone https://github.com/yurabulany/nvim.git
git clone https://github.com/yurabulany/kmonad.git

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
sudo dnf install lazygit

# tlp section
sudo dnf install tlp
## for fedora 41 and newer 
sudo dnf remove tuned tuned-ppd
sudo systemctl enable tlp.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
## set the charge treshold
sudo tlp setcharge BAT0 1





reboot
