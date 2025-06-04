#!/bin/bash

# Arch Linux Post-Installation Setup Script
# Make executable: chmod +x setup.sh

set -e  # Exit on error

echo "=== Arch Linux Setup Script ==="

# Update system
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install yay (AUR helper)
if ! command -v yay &> /dev/null; then
    echo "Installing yay AUR helper..."
    sudo pacman -S --needed --noconfirm git base-devel
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
fi

# Core system packages
echo "Installing core system packages..."
ALL_PACKAGES=(
    "1password"
    "amd-ucode"
    "base"
    "base-devel"
    "btop"
    "copyq"
    "curl"
    "darktable"
    "discord"
    "docker"
    "docker-compose"
    "fzf"
    "gamemode"
    "gcc"
    "git"
    "google-chrome"
    "grimblast-git"
    "htop"
    "hypridle"
    "hyprland"
    "hyprlock"
    "hyprpaper"
    "hyprpicker"
    "hyprpolkitagent"
    "hyprsunset"
    "hyprsysteminfo"
    "inkscape"
    "kitty"
    "less"
    "lib32-gamemode"
    "lib32-nvidia-utils"
    "lib32-pipewire"
    "linux"
    "linux-firmware"
    "lua51"
    "luarocks"
    "make"
    "mako"
    "man-db"
    "man-pages"
    "neovim"
    "networkmanager"
    "nodejs"
    "noto-fonts"
    "noto-fonts-cjk"
    "noto-fonts-emoji"
    "npm"
    "nvidia"
    "nvidia-settings"
    "nvidia-utils"
    "obsidian"
    "openssh"
    "pavucontrol"
    "pipewire"
    "pipewire-alsa"
    "pipewire-jack"
    "pipewire-pulse"
    "python"
    "qt5-wayland"
    "ripgrep"
    "rofi-lbonn-wayland-git"
    "rofi-wayland"
    "sddm"
    "spotify"
    "steam"
    "sudo"
    "tar"
    "telegram-desktop"
    "texinfo"
    "thunar"
    "thunar-archive-plugin"
    "thunar-media-tags-plugin"
    "thunar-volman"
    "tmux"
    "tree"
    "ttf-jetbrains-mono-nerd"
    "unzip"
    "vi"
    "vim"
    "waybar"
    "wget"
    "which"
    "wireplumber"
    "xdg-desktop-portal-hyprland"
    "yay"
    "yay-debug"
    "zsh"
    "zsh-autosuggestions"
)

yay -S --needed --noconfirm "${ALL_PACKAGES[@]}"

# Enable services
echo "Enabling system services..."
sudo systemctl enable NetworkManager
sudo systemctl enable pipewire
sudo systemctl enable pipewire-pulse
