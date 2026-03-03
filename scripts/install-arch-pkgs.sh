#!/usr/bin/env bash

set -euo pipefail

if ! command -v yay &>/dev/null; then
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git
  (cd yay && makepkg -si)
fi

YAY_PACKAGES=(
  neovim-nightly-bin jetbrains-toolbox
)

PACMAN_PKGS=(
  sway swaybg swayidle swaylock waybar xdg-desktop-portal-wlr wofi wl-clipboard
  vim zed fzf kitty lazygit stow clang cmake npm rust-analyzer
)

sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"
yay -S --needed --noconfirm "${YAY_PACKAGES[@]}"
