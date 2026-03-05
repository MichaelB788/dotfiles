#!/usr/bin/env bash

set -euo pipefail

[[ $EUID -ne 0 ]] || {
  echo "Error: do not run this script as root."
  exit 1
}

WAYLAND_PKGS=(
  foot
  sway
  swaybg
  swayidle
  swaylock
  waybar
  wofi
  wl-clipboard
)

XORG_PKGS=(
  i3
  i3status
  i3lock
  xorg-x11-server
  xinit
  xterm
  xclip
  picom
  rofi
  xdg-desktop-portal-gtk
  feh
)

ZYPPER_PKGS=(
  # Dev tools
  vim
  code
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
  NetworkManager-applet
)

build_nvim() {
  git clone https://github.com/neovim/neovim
  (
    cd neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
  )
  rm -rf neovim
}

install_suse_pkgs() {
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

  # Add code oss to keyring
  zypper ar -cf https://download.opensuse.org/repositories/devel:/tools:/ide:/vscode/openSUSE_Tumbleweed devel_tools_ide_vscode

  # Install display server specific packages
  if $INSTALL_XORG; then sudo zypper install -y "${XORG_PKGS[@]}"; fi
  if $INSTALL_WAYLAND; then sudo zypper install -y "${WAYLAND_PKGS[@]}"; fi

  # Install packages
  sudo zypper install -y "${ZYPPER_PKGS[@]}"
  build_nvim
}

install_suse_pkgs
