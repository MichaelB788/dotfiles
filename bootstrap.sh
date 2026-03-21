#!/usr/bin/env bash

set -euo pipefail

bootstrap() {
  local dotfiles_path
  dotfiles_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

  local scripts="${dotfiles_path}/scripts"

  # Install OS specific packages
  "${scripts}/install-arch-pkgs.sh"

  # Stow dotfiles
  "${scripts}/stow-dotfiles.sh" "${dotfiles_path}/modules"

  # Install vim plugins
  "${scripts}/install-vim-plugins.sh"
}

bootstrap
