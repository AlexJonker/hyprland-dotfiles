#!/bin/bash
read -p "This script has not been fully tested, do you still want to continue? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Continuing..."

    yay -S --needed --noconfirm - < ./dependencies.txt

    cp -r ./configs/* ~/.config/
    mkdir ~/Scripts
    cp -r ./scripts/* ~/Scripts/

    chsh -s $(which fish)

    betterdiscordctl install
    spicetify auto
else
    echo "Exiting..."
    exit 1
fi