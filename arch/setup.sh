#!/bin/bash

# Arch Linux Post-Installation Setup Script
# Make executable: chmod +x setup.sh

set -e  # Exit on error

echo "=== Arch Linux Setup Script ==="

# Update system
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Core system packages
echo "Installing core system packages..."
CORE_PACKAGES=(
    "btop"
    "curl"
    "darktable"
    "docker"
    "docker-compose"
    "fzf"
    "gcc"
    "git"
    "google-chrome"
    "htop"
    "inkscape"
    "less"
    "lua51"
    "luarocks"
    "make"
    "man-db"
    "man-pages"
    "neovim"
    "networkmanager"
    "nodejs"
    "npm"
    "openssh"
    "obsidian"
    "python"
    "ripgrep"
    "sudo"
    "tar"
    "telegram-desktop"
    "tmux"
    "tree"
    "unzip"
    "vi"
    "vim"
    "wget"
    "which"
    "zsh"
    "zsh-autosuggestions"
)

sudo pacman -S --needed --noconfirm "${CORE_PACKAGES[@]}"

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

# Hyprland and desktop environment
echo "Installing Hyprland packages..."
HYPRLAND_PACKAGES=(
    "hyprland"
    "hyprsunset"
    "kitty"
    "mako"
    "nm-connection-editor"
    "pavucontrol"
    "playerctl"
    "polkit-gnome"
    "thunar"
    "thunar-archive-plugin"
    "thunar-volman"
    "waybar"
    "xdg-desktop-portal-hyprland"
)

sudo pacman -S --needed --noconfirm "${HYPRLAND_PACKAGES[@]}"

# Fonts and themes
echo "Installing fonts and themes..."
FONT_PACKAGES=(
    "noto-fonts"
    "noto-fonts-cjk"
    "noto-fonts-emoji"
    "ttf-dejavu"
    "ttf-font-awesome"
    "ttf-jetbrains-mono-nerd"
    "ttf-liberation"
)

sudo pacman -S --needed --noconfirm "${FONT_PACKAGES[@]}"

# Audio system
echo "Installing audio system..."
AUDIO_PACKAGES=(
    "pipewire"
    "pipewire-pulse"
    "pipewire-alsa"
    "pipewire-jack"
    "wireplumber"
)

sudo pacman -S --needed --noconfirm "${AUDIO_PACKAGES[@]}"

# Gaming packages (optional - uncomment if needed)
echo "Installing gaming packages..."
GAMING_PACKAGES=(
    "steam"
    "gamemode"
    "lib32-gamemode"
    "nvidia"
    "nvidia-utils"
    "lib32-nvidia-utils"
    "nvidia-settings"
)

sudo pacman -S --needed --noconfirm "${GAMING_PACKAGES[@]}"

# AUR packages
echo "Installing AUR packages..."
AUR_PACKAGES=(
    "rofi-lbonn-wayland-git"
    "grimblast-git"
    "hyprpaper"
    "hypridle"
    "hyprlock"
    "spotify"
    "discord"
)

yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

# Enable services
echo "Enabling system services..."
sudo systemctl enable NetworkManager
sudo systemctl enable pipewire
sudo systemctl enable pipewire-pulse
