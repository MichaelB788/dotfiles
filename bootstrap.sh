#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

PKGS_PATH="$DOTFILES_PATH/pkgs"
if command -v pacman >/dev/null; then
  sudo pacman -Syu
  xargs -a "$PKGS_PATH/pacman.txt" sudo pacman -S --needed
elif command -v zypper >/dev/null; then
  sudo zypper dup
  xargs -a "$PKGS_PATH/zypper.txt" sudo zypper install
elif command -v apt >/dev/null; then
  sudo apt update && sudo apt upgrade
  xargs -a "$PKGS_PATH/apt.txt" sudo apt install
fi

stow -d "$DOTFILES_PATH/modules" -t "$HOME" vim nvim kitty sway zed i3
