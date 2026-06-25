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
fi

# Stow dotfiles
(cd "$DOTFILES_PATH/modules" && stow -Rt "$HOME" */)

# Download wallpaper
wget -nc -P "$HOME/Pictures" https://w.wallhaven.cc/full/je/wallhaven-jevqpy.png

# Download JetBrainsMono nerd font
wget -nc -P "$HOME/.local/share/fonts" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
