#!/usr/bin/env bash

set -euo pipefail

install_pacman_packages() {
  local PACMAN_PACKAGES=(
    gvim fzf kitty lazygit direnv stow clang
  )

  sudo pacman -S --needed --noconfirm "${PACMAN_PACKAGES[@]}"
}

install_pacman_packages
