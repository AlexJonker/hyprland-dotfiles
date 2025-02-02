#!/bin/bash
read -p "This script has not been fully tested, do you still want to continue? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]
then
    echo "Continuing..."

    swww img ~/Pictures/Wallpapers/4pqrn9xjdcsc1.jpeg
    bash ~/Scripts/pywal.sh

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