#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
PKGS_PATH="$DOTFILES_PATH/pkgs"

# Install packages
if command -v pacman >/dev/null; then # Arch setup
  sudo pacman -Syu --noconfirm
  xargs -a "$PKGS_PATH/pacman.txt" sudo pacman -S --needed --noconfirm
elif command -v xbps-install >/dev/null; then # Void setup
  sudo xbps-install -Syu
  xargs -a "$PKGS_PATH/xbps.txt" sudo xbps-install -y
elif command -v apt >/dev/null; then # Debian setup
  sudo apt update && sudo apt upgrade
  xargs -a "$PKGS_PATH/apt.txt" sudo apt install
fi

# Stow dotfiles
stow -d "$DOTFILES_PATH/modules" -t "$HOME" vim nvim kitty sway zed i3
