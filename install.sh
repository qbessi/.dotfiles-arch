#!/bin/bash
set -e

# Ensure system is updated
sudo pacman -Syu --noconfirm

# Install build tools and Git (required for AUR)
sudo pacman -S --needed --noconfirm git base-devel

# Install yay AUR helper
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf /tmp/yay

# Install user packages
yay -S --noconfirm \
  1password \
  blueman \
  bluez \
  bluez-tools \
  dunst \
  firefox \
  ghostty \
  grim \
  grimblast-git \
  transmission-bt \
  cliphist \
  htop \
  hypridle \
  hyprland \
  hyprlock \
  hyprpicker \
  mullvad-vpn \
  nautilus \
  neofetch \
  neovim \
  obsidian \
  pamixer \
  slurp \
  synology-drive \
  tofi \
  ttf-jetbrains-mono-nerd \
  waybar \
  discord \
  gnome-boxes \
  
  zsh

# Refresh font cache
fc-cache -fv

# Autostart Synology Drive on login
mkdir -p ~/.config/autostart
if [ -f /usr/share/applications/synology-drive.desktop ]; then
  cp /usr/share/applications/synology-drive.desktop ~/.config/autostart/
fi

echo "Installation complete."
