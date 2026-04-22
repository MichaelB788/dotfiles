#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
PKGS_PATH="$DOTFILES_PATH/pkgs"

# Install packages
install_packages() {
  if command -v pacman >/dev/null; then
    sudo pacman -Syu
    xargs -a "${PKGS_PATH}/pacman.txt" sudo pacman -S --needed
  elif command -v xbps-install >/dev/null; then
    sudo xbps-install -Su
    xargs -a "${PKGS_PATH}/xbps.txt" sudo xbps-install
  elif command -v zypper >/dev/null; then
    sudo zypper dist-upgrade
    xargs -a "${PKGS_PATH}/zypper.txt" sudo zypper install
    # Install stable version of Rust and Cargo
    rustup toolchain install stable
  fi
}

# Stow modules
stow_mod() {
  stow -d "$DOTFILES_PATH/modules" -t "$HOME" "$1"
}

stow_necessary() {
  stow_mod "vim"
  stow_mod "nvim"
  stow_mod "kitty"
}

stow_twm_conf() {
  read -p "Would you like to set up a TWM? (y/N): " ans 
  if [[ "$ans" =~ ^[Yy]$ ]]; then
    select opt in "sway" "i3" "both" "neither"; do
      case $opt in
        "sway") stow_mod "sway"; break ;;
        "i3") stow_mod "i3"; break ;;
        "both")
          stow_mod "sway"
          stow_mod "i3"
          break
          ;;
        "nevermind") break ;;
        *) echo "Invalid option" ;;
      esac
    done
  fi
}

install_packages
stow_necessary
stow_twm_conf
