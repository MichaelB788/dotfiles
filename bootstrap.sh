#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
PKGS_PATH="$DOTFILES_PATH/pkgs"
MODULES_PATH="$DOTFILES_PATH/modules"

if command -v pacman >/dev/null; then # Arch setup
  sudo pacman -Syu --noconfirm
  xargs -a "$PKGS_PATH/pacman.txt" sudo pacman -S --needed --noconfirm
elif command -v dnf >/dev/null; then # Fedora setup
  sudo dnf -y update
  sudo dnf copr enable -y atim/lazygit
  sudo dnf copr enable -y scottames/ghostty
  xargs -a "$PKGS_PATH/dnf.txt" sudo dnf install -y
elif command -v apt >/dev/null; then # Debian setup
  sudo apt update
  sudo apt upgrade
  xargs -a "$PKGS_PATH/apt.txt" sudo apt install
fi

# Stow dotfiles
(cd "$MODULES_PATH" && stow -Rt "$HOME" */)

# Download wallpaper
wget -nc -P "$HOME/Pictures" https://w.wallhaven.cc/full/je/wallhaven-jevqpy.png
