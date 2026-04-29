#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
PKGS_PATH="$DOTFILES_PATH/packages"

# Stows the module should the binary exist
stow_mod() {
  stow -d "$DOTFILES_PATH/modules" -t "$HOME" "$1"
}

# Upgrade, then install packages
if command -v apt >/dev/null; then
  sudo apt full-upgrade
  xargs -a "${PKGS_PATH}/apt.txt" sudo apt install
elif command -v pacman >/dev/null; then
  sudo pacman -Syu
  xargs -a "${PKGS_PATH}/pacman.txt" sudo pacman -S
fi

# Stow modules
stow_mod "vim"
stow_mod "nvim"
stow_mod "kitty"

read -rp "Stow TWM config [y/N]? " -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
  stow_mod "i3"
  stow_mod "sway"
fi
