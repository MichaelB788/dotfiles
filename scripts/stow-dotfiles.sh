#!/usr/bin/env bash

set -euo pipefail

symlink-dotfiles() {
  local path_to_modules="${1}"
  (cd "$path_to_modules" && for mod in *; do stow -t "$HOME" "$mod"; done)
}

symlink-dotfiles "${1}"