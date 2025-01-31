# Hyprland Dotfiles Setup

## TODO:
- **Customize Waybar**
- **Wi-Fi Menu Integration:** Add the [rofi-wifi-menu](https://github.com/ericmurphyxyz/rofi-wifi-menu)
- **Bluetooth Menu Integration:** Use [rofi-bluetooth](https://github.com/nickclyde/rofi-bluetooth)
- **Bibata modern ice cursor**
- **Dark mode**
- **spicetify**
- **adblockify**

---

## Installation Guide

### **1. Backup Configuration Files**
Before proceeding, **create a backup of your `.config` folder** to ensure you can restore your previous setup if needed.

### **2. Install Yay (AUR Helper)**


```bash
# Clone the yay repository
git clone https://aur.archlinux.org/yay.git
cd yay

# Build and install yay
makepkg -si
```

### **3. Clone and Run the Install Script**

```bash
# Clone the Hyprland dotfiles repository
git clone https://github.com/MeneerAlex/hyprland-dotfiles
cd hyprland-dotfiles

# Run the install script
bash ./install.sh
```

### **4. Configure Display Settings**
After installation, configure your screen layout using `nwg-displays`:

```bash
nwg-displays
```

---
