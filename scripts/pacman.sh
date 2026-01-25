#!/usr/bin/env bash

set -euo pipefail

install_pacman_packages() {
  local PACMAN_PACKAGES=(
    gvim fzf kitty lazygit direnv stow
  )

  echo "Installing packages via pacman..."
  sudo pacman -S --needed --noconfirm "${PACMAN_PACKAGES[@]}" > /dev/null
}

install_pacman_packages