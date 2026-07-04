#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

PKGS_PATH="$DOTFILES_PATH/pkgs"
if command -v dnf >/dev/null; then # Fedora Setup
  sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
  sudo dnf -y update
  xargs -a "$PKGS_PATH/dnf.txt" sudo dnf install -y
elif command -v xbps-install >/dev/null; then # Void Setup
  sudo xbps-install -Syu
  xargs -a "$PKGS_PATH/xbps.txt" sudo xbps-install -y
elif command -v apt >/dev/null; then # Debian
  sudo apt update
  sudo apt upgrade
  xargs -a "$PKGS_PATH/apt.txt" sudo apt install

  # Install neovim binary
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo rm -rf /opt/nvim-linux-x86_64
  sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
  echo "export PATH='$PATH:/opt/nvim-linux-x86_64/bin'" >> "$HOME/.bashrc" 

fi

# Stow dotfiles
(cd "$DOTFILES_PATH/modules" && stow -Rt "$HOME" */)

# Download wallpaper
wget -nc -P "$HOME/Pictures" "https://w.wallhaven.cc/full/je/wallhaven-jevqpy.png"

# Download JetBrainsMono nerd font
FONT_PATH="$HOME/.local/share/fonts"
JETBRAINS_FONT_PATH="$FONT_PATH/JetBrainsMono"
if [ ! -d "$JETBRAINS_FONT_PATH" ]; then
  wget -nc -P "$FONT_PATH" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
  unzip "$FONT_PATH/JetBrainsMono.zip" -d "$JETBRAINS_FONT_PATH"
  rm "$FONT_PATH/JetBrainsMono.zip"
  fc-cache -fv
fi
