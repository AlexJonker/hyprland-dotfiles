#!/bin/bash
read -p "This script has not been fully tested, do you still want to continue? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]
then
    echo "Continuing..."

    swww img ~/Pictures/Wallpapers/ForestHouse.png
    bash ~/Scripts/pywal.sh

    # gtk and qt theme changing
    sudo flatpak override --filesystem=xdg-config/gtk-3.0
    sudo flatpak override --filesystem=xdg-config/gtk-4.0
    mkdir ~/.config/presets/user
    cd ~/.config/presets/user
    ln -s ~/.cache/wal/pywal.json

    cd ~/.config/Kvantum
    mkdir pywal
    cd pywal
    ln -s ~/.cache/wal/pywal.kvconfig
    ln -s ~/.cache/wal/pywal.svg
    ln -s ~/.cache/wal/pywal.kvconfig
    ln -s ~/.cache/wal/pywal.svg


    betterdiscordctl install
    spicetify auto

    read -p "Done! do you want to reboot? (y/n): " choice2
    if [[ "$choice2" == "y" || "$choice2" == "Y" ]]
    then
        reboot
    fi
else
    echo "Exiting..."
    exit 1
fi