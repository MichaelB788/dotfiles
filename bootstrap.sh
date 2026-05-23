#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
PKGS_PATH="$DOTFILES_PATH/pkgs"

# Install packages
if command -v pacman >/dev/null; then # Arch setup
  sudo pacman -Syu
  xargs -a "$PKGS_PATH/pacman.txt" sudo pacman -S --needed

  # Install yay
  if ! command -v yay >/dev/null; then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
  fi
elif command -v apt >/dev/null; then # Debian setup
  sudo apt update && sudo apt upgrade
  xargs -a "$PKGS_PATH/apt.txt" sudo apt install

  # Install neovim from archive
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo rm -rf /opt/nvim-linux-x86_64
  sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
  echo "export PATH='$PATH:/opt/nvim-linux-x86_64/bin'" >> ~/.bashrc
fi

# Stow dotfiles
stow -d "$DOTFILES_PATH/modules" -t "$HOME" vim nvim kitty sway zed i3
