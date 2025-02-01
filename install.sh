#!/bin/bash
read -p "This script has not been fully tested, do you still want to continue? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Continuing..."
    git clone https://aur.archlinux.org/yay.git
    cd yay

    makepkg -si
    cd ..
    rm -fr yay

    yay -S --needed --noconfirm - < ./dependencies.txt

    cp -r ./configs/* ~/.config/
    mkdir ~/Scripts
    cp -r ./scripts/* ~/Scripts/

    mkdir ~/Pictures/Wallpapers/
     cp -r ./Wallpapers/* ~/Pictures/Wallpapers/

    chsh -s $(which fish)
    sudo systemctl enable sddm

    nohup discord &
    nohup spotify &
    sleep 2
    killall Discord
    killall spotify

    betterdiscordctl install
    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R
    spicetify auto

    sudo mkdir /etc/sddm.conf.d/
    echo -e "[Theme]\nCurrent=corners" | sudo tee /etc/sddm.conf.d/sdd.conf > /dev/null



    echo "Done! rebooting in 5 seconds."
    sleep 5
    reboot
else
    echo "Exiting..."
    exit 1
fi