#!/usr/bin/env bash

set -euo pipefail

[[ $EUID -ne 0 ]] || {
  echo "Error: do not run this script as root."
  exit 1
}

WAYLAND_PKGS=(
  sway
  swaybg
  swayidle
  swaylock
  waybar
  wofi
  xdg-desktop-portal-wl
  wl-clipboard
)

XORG_PKGS=(
  i3-wm
  i3status
  i3lock
  xorg-server
  xorg-xinit
  xterm
  xclip
  picom
  rofi
  xdg-desktop-portal-gtk
)

YAY_PACKAGES=(
  neovim-nightly-bin jetbrains-toolbox visual-studio-code-bin
)

PACMAN_PKGS=(
  # Dev tools
  vim
  fzf
  kitty
  lazygit
  stow
  clang
  cmake
  ninja
  npm
  rust-analyzer

  # Utilities
  thunar
  network-manager-applet
)

install_arch_pkgs() {
  if ! command -v yay &>/dev/null; then
    {
      mkdir -p /tmp/yay && cd /tmp/yay
      sudo pacman -S --needed --noconfirm git base-devel
      git clone https://aur.archlinux.org/yay.git
      (cd yay && makepkg -si)
    }
    rm -rf /tmp/yay
  fi

  echo "Select display server to install:"
  select ds in "xorg" "wayland" "both"; do
    case $ds in
    xorg)
      INSTALL_XORG=true
      INSTALL_WAYLAND=false
      break
      ;;
    wayland)
      INSTALL_XORG=false
      INSTALL_WAYLAND=true
      break
      ;;
    both)
      INSTALL_XORG=true
      INSTALL_WAYLAND=true
      break
      ;;
    *) echo "Invalid option." ;;
    esac
  done

  # Install display server specific packages
  if [[ $INSTALL_XORG ]]; then sudo pacman -S --needed --noconfirm "${XORG_PKGS[@]}"; fi
  if [[ $INSTALL_WAYLAND ]]; then sudo pacman -S --needed --noconfirm "${WAYLAND_PKGS[@]}"; fi

  # Install packages
  sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"
  yay -S --needed --noconfirm "${YAY_PACKAGES[@]}"
}

install_arch_pkgs
