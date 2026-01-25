#!/usr/bin/env bash

set -euo pipefail

install_yay_packages() {
  if ! command -v yay &> /dev/null; then
    echo "yay undetected. Installing yay..."
    {
      sudo pacman -S --needed --noconfirm git base-devel
      git clone https://aur.archlinux.org/yay.git
      (cd yay && makepkg -si)
    } >/dev/null
  fi

  local YAY_PACKAGES=(
    neovim-nightly-bin jetbrains-toolbox visual-studio-code-bin
  )

  echo "Installing packages via yay..."
  yay -S --needed --noconfirm "${YAY_PACKAGES[@]}" > /dev/null
}

install_yay_packages