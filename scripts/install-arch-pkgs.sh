#!/usr/bin/env bash

set -euo pipefail

if ! command -v yay &>/dev/null; then
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git
  (cd yay && makepkg -si)
fi

WAYLAND_PKGS=(
  sway swaybg swayidle swaylock waybar xdg-desktop-portal-wlr wofi wl-clipboard
)

XORG_PKGS=(
  i3-wm i3status i3lock xorg-server xorg-xinit xterm
)

YAY_PACKAGES=(
  neovim-nightly-bin jetbrains-toolbox
)

PACMAN_PKGS=(
  vim zed fzf kitty lazygit stow clang cmake npm rust-analyzer thunar picom rofi
  network-manager-applet
)

sudo pacman -S --needed --noconfirm "${XORG_PKGS[@]}"
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"
yay -S --needed --noconfirm "${YAY_PACKAGES[@]}"
