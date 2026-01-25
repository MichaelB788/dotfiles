#!/usr/bin/env bash

set -euo pipefail

symlink-dotfiles() {
  local path_to_modules="${1}"
  local dotfiles_to_stow=(bin kitty nvim vim)
  (cd "$path_to_modules" && for mod in "${dotfiles_to_stow[@]}"; do stow -t "$HOME" "$mod"; done)
}

symlink-dotfiles "${1}"
