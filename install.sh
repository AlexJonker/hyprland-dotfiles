#!/bin/bash
read -p "This script has not been fully tested, do you still want to continue? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]
then
    echo "Continuing..."

    # Modify makepkg.conf and pacman.conf
    sudo sed -i '/^OPTIONS=/s/\(.*\)debug\(.*\)/\1!debug\2/' /etc/makepkg.conf
    sudo sed -i '/\[options\]/a ILoveCandy' /etc/pacman.conf
    sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf

    # Check if yay is installed, if not, install it
    if ! command -v yay &>/dev/null
    then
        echo "yay not found. Installing yay..."
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    fi

    # Install dependencies from dependencies.txt
    yay -S --needed --noconfirm - < ./dependencies.txt

    # Copy configs, scripts, wallpapers, etc.
    cp -a ./configs/. ~/.config/
    mkdir -p ~/Scripts
    cp -a ./scripts/. ~/Scripts/

    mkdir -p ~/Pictures/Wallpapers
    cp -a ./Wallpapers/. ~/Pictures/Wallpapers/
    cp ./avatar.png ~/Pictures/

    # Install system themes
    sudo cp -a ./themes/. /usr/share/themes/
    gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
    settings set org.gnome.desktop.interface icon-theme Tela
    gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice

    # Change shell to fish
    chsh -s $(which fish)

    # Enable sddm (simple login manager)
    sudo systemctl enable sddm

    # Adjust Spotify permissions (ensure it's necessary for your setup)
    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R

    # Set SDDM theme configuration
    sudo mkdir -p /etc/sddm.conf.d/

    echo -e "[Theme]\nCurrent=corners" | sudo tee /etc/sddm.conf > /dev/null
    sudo chmod -R 777 /usr/share/sddm/themes/corners/backgrounds # allow the pywal script to write the image
    sudo touch /var/lib/sddm/state.conf

    # Set last logged-in user in SDDM state.conf
    echo -e "[Last]
    # Name of the last logged-in user.
    # This user will be preselected when the login screen appears
    User=$(whoami)

    # Name of the session for the last logged-in user.
    # This session will be preselected when the login screen appears.
    Session=/usr/share/wayland-sessions/hyprland.desktop" | sudo tee /var/lib/sddm/state.conf > /dev/null

    # Install GTK3 themes via Flatpak
    flatpak install -y --system org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark

    echo "Please reboot and run the post-install.sh script."

    # Reboot prompt
    read -p "Done! Do you want to reboot? (y/n): " choice2
    if [[ "$choice2" == "y" || "$choice2" == "Y" ]]
    then
        reboot
    fi
else
    echo "Exiting..."
    exit 1
fi
