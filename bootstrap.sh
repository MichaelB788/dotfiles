#!/usr/bin/env bash

set -euo pipefail

bootstrap() {
  local dotfiles_path
  dotfiles_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

  "$dotfiles_path"/scripts/install-arch-pkgs.sh
  "$dotfiles_path"/scripts/stow-dotfiles.sh "$dotfiles_path"/modules/
}

bootstrap
