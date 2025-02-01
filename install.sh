#!/bin/bash
read -p "This script has not been fully tested, do you still want to continue? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]
then
    echo "Continuing..."

    sudo sed -i '/^OPTIONS=/s/\(.*\)debug\(.*\)/\1!debug\2/' /etc/makepkg.conf
    sudo sed -i '/\[options\]/a ILoveCandy' /etc/pacman.conf
    sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf

    if ! command -v yay 2>&1 >/dev/null
    then
        git clone https://aur.archlinux.org/yay.git
        cd yay

        makepkg -si --noconfirm
        cd ..
        rm -fr yay
    fi


    yay -S --needed --noconfirm - < ./dependencies.txt

    cp -a ./configs/. ~/.config/
    mkdir ~/Scripts
    cp -a ./scripts/. ~/Scripts/

    mkdir ~/Pictures/
    mkdir ~/Pictures/Wallpapers/
    cp -a ./Wallpapers/. ~/Pictures/Wallpapers/
    cp ./avatar.png ~/Pictures/

    sudo cp -a ./themes/. /usr/share/themes/

    cp -a ./home/. ~/

    chsh -s $(which fish)
    sudo systemctl enable sddm


    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R

    sudo mkdir /etc/sddm.conf.d/

    echo -e "[Theme]\nCurrent=corners" | sudo tee /etc/sddm.conf.d/sdd.conf > /dev/null
    sudo sed -i "s/^User.*/User=$(whoami)/" /var/lib/sddm/state.conf
    sudo sed -i "s/^Session.*/Session=\/usr\/share\/wayland-sessions\/hyprland.desktop/" /var/lib/sddm/state.conf


    #swww-daemon
    #swww img ~/Pictures/Wallpapers/4pqrn9xjdcsc1.jpeg
    #bash ~/Scripts/pywal.sh

    flatpak install -y --system org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark

    read -p "Done! do you want to reboot? (y/n): " choice2
    if [[ "$choice2" == "y" || "$choice2" == "Y" ]]
    then
      reboot
    fi
else
    echo "Exiting..."
    exit 1
fi