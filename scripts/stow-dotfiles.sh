#!/usr/bin/env bash

set -euo pipefail

MODULES="${1:?Usage: $0 <path/to/dotfiles/modules>}"

find "$MODULES" -maxdepth 1 -mindepth 1 -type d -exec sh -c '
  stow -d "$1" -t "$HOME" "$(basename "$2")" 
' shell "$MODULES" {} \;
