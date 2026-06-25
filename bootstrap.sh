#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
PKGS_PATH="$DOTFILES_PATH/pkgs"
if command -v dnf >/dev/null; then # Fedora Setup
  # Add the Terra repo
  sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release -y

  sudo dnf -y update
  xargs -a "$PKGS_PATH/dnf.txt" sudo dnf install -y
elif command -v xbps-install >/dev/null; then # Void Setup
  sudo xbps-install -Syu
  xargs -a "$PKGS_PATH/xbps.txt" sudo xbps-install -y
fi

# Stow dotfiles
(cd "$MODULES_PATH" && stow -Rt "$HOME" */)

# Download wallpaper
wget -nc -P "$HOME/Pictures" https://w.wallhaven.cc/full/je/wallhaven-jevqpy.png
