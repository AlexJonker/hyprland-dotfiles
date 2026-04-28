#!/bin/bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -fr yay
yay -S niri xwayland-sattelite noctalia-shell kitty zen-browser nemo ttf-cascadia-code-nerd sddm brightnessctl imagemagick python power-profiles-daemon bluez gamemode cliphist wlsunset xdg-desktop-portal evolution-data-server kwallet --noconfirm --needed
sudo systemctl enable sddm
sudo systemctl enable power-profiles-daemon