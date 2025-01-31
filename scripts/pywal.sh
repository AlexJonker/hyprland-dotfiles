#!/bin/bash

spicetify_theme=$(grep current_theme ~/.config/spicetify/config-xpui.ini | awk '{print $3}')
wallpaper=$(swww query | grep -oP 'image:\s*\K.*' | head -n 1)

echo "----------------------------------"
echo $wallpaper
echo "----------------------------------"

wal -i "$wallpaper" &&
#sleep 5 &&
pywalfox update &&
pywal-discord &&
pywal-spicetify "$spicetify_theme"








#spicetify watch -s &
#sleep 1 && pkill spicetify