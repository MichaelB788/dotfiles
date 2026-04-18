#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

SCRIPTS_PATH="${DOTFILES_PATH}/scripts"

# Install packages
"${SCRIPTS_PATH}/install-pkgs.sh"

# Stow dotfiles
"${SCRIPTS_PATH}/stow-dotfiles.sh" "${DOTFILES_PATH}/modules"

# Install vim plugins
"${SCRIPTS_PATH}/install-vim-plugins.sh"
