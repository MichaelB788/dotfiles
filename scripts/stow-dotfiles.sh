#!/usr/bin/env bash

set -euo pipefail

symlink-dotfiles() {
  if ! [ -d "$1" ]; then
    echo "Could not find modules directory at $1"
    exit 1
  fi

  local path_to_modules="$1"
  local dotfiles_to_stow=(bin kitty nvim vim sway i3 rofi)

  (
    cd "$path_to_modules"
    for mod in "${dotfiles_to_stow[@]}"; do
      stow -t "$HOME" "$mod"
    done
  )
}

symlink-dotfiles "$1"
