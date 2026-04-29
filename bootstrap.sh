#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

# Stows the module should the binary exist
stow_mod() {
  if command -v "$1" >/dev/null; then
    stow -d "$DOTFILES_PATH/modules" -t "$HOME" "$1"
  fi
}

# Upgrade, then install packages
sudo apt full-upgrade
xargs -a "${DOTFILES_PATH}/apt_pkgs.txt" sudo apt install 

# Install neovim if it doesn't exist
if ! command -v nvim >/dev/null; then
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo rm -rf /opt/nvim-linux-x86_64
  sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

  echo "export PATH='$PATH:/opt/nvim-linux-x86_64/bin'" >> $HOME/.bashrc
fi

# Stow modules
stow_mod "vim"
stow_mod "nvim"
stow_mod "kitty"
stow_mod "zed"
stow_mod "i3"
stow_mod "sway"
