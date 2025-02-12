#!/bin/bash
sleep 2
spicetify_theme=$(grep current_theme ~/.config/spicetify/config-xpui.ini | awk '{print $3}')
wallpaper=$(swww query | grep -oP 'image:\s*\K.*' | head -n 1)

echo "----------------------------------"
echo $wallpaper
echo "----------------------------------"

cp $wallpaper ~/.config/hypr/current_wallpaper
cp $wallpaper /usr/share/sddm/themes/corners/backgrounds/current_wallpaper

wal -i "$wallpaper" &&
#sleep 5 &&
pywalfox update &&
pywal-discord #&&
pywal-spicetify "$spicetify_theme"
