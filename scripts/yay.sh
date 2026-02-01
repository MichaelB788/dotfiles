#!/usr/bin/env bash

set -euo pipefail

install_yay_packages() {
  if ! command -v yay &> /dev/null; then
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git
    (cd yay && makepkg -si)
  fi

  local YAY_PACKAGES=(
    neovim-nightly-bin jetbrains-toolbox visual-studio-code-bin
  )

  echo "Installing packages via yay..."
  yay -S --needed --noconfirm "${YAY_PACKAGES[@]}"
}

install_yay_packages
