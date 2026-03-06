#!/usr/bin/env bash

set -euo pipefail

bootstrap() {
  local dotfiles_path
  dotfiles_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

  local scripts="${dotfiles_path}/scripts"
  local install="${scripts}/install"

  # Install OS specific packages
  echo "Which distro would you like to setup?"
  select dist in "Arch" "openSUSE"; do
    case $dist in
    Arch)
      "${install}/arch-pkgs.sh"
      break
      ;;
    openSUSE)
      "${install}/suse-pkgs.sh"
      break
      ;;
    esac
  done

  # Stow dotfiles
  "${scripts}/stow-dotfiles.sh" "${dotfiles_path}/modules"

  # Install vim plugins
  "${install}/vim-plugins.sh"
}

bootstrap
