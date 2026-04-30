#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

# Stows the module should the binary exist
stow_mod() {
  stow -d "$DOTFILES_PATH/modules" -t "$HOME" "$1"
}

# Upgrade, then install packages
if command -v zypper >/dev/null; then
  sudo zypper dup
  xargs -a "$DOTFILES_PATH/zypper.txt" sudo zypper install
fi

# Stow modules
stow_mod "vim"
stow_mod "nvim"
stow_mod "kitty"

read -rp "Would you like to setup sway? [y/N] " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo zypper addlock sway-branding-openSUSE
  sudo zypper install sway wofi
  stow_mod "sway"
fi
