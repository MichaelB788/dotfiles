#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
SCRIPTS_PATH="${DOTFILES_PATH}/scripts"

"${SCRIPTS_PATH}/manage-pkgs.sh"
"${SCRIPTS_PATH}/stow-dotfiles.sh" "${DOTFILES_PATH}/modules"
