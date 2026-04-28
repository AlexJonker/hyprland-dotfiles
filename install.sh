#!/bin/bash
set -e

# Setup chaotic aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

printf '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n' | sudo tee -a /etc/pacman.conf > /dev/null

sudo pacman -Syu --noconfirm

# Install yay
rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -fr yay

# Install packages
yay -S niri xwayland-sattelite noctalia-shell kitty zen-browser nemo ttf-cascadia-code-nerd sddm brightnessctl imagemagick python power-profiles-daemon bluez gamemode cliphist wlsunset xdg-desktop-portal evolution-data-server kwallet --noconfirm --needed

# Enable services
sudo systemctl enable sddm
sudo systemctl enable power-profiles-daemon