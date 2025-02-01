# Hyprland Dotfiles Setup

<img src="./src/preview.png">

## TODO
- **Customize Waybar**
- **Wi-Fi Menu Integration:** Add the [rofi-wifi-menu](https://github.com/ericmurphyxyz/rofi-wifi-menu)
- **Bluetooth Menu Integration:** Use [rofi-bluetooth](https://github.com/nickclyde/rofi-bluetooth)
- **Bibata Modern Ice Cursor**
- **Dark Mode**
- **Spicetify**
- **Adblockify**

---

## Installation Guide

### **This is meant to be run on a fresh Arch Linux install!**

### **1. Clone and Run the Install Script**

```bash
# Clone the Hyprland dotfiles repository
git clone https://github.com/MeneerAlex/hyprland-dotfiles
cd hyprland-dotfiles

# Run the install script
bash ./install.sh
```

### **2. Configure Display Settings**

After installation, reboot and run the `post-install.sh` script and configure your screen(s) with `nwg-look`
```bash
bash ./post-install.sh && nwg-look
```