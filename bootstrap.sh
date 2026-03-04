#!/usr/bin/env bash

set -euo pipefail

bootstrap() {
  local dotfiles_path
  dotfiles_path=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

  # Install packages
  echo "Which distro would you like to setup?"
  select dist in "Arch" "openSUSE"; do
    case $dist in
    Arch)
      "${dotfiles_path}/scripts/install-arch-pkgs.sh"
      break
      ;;
    openSUSE)
      "${dotfiles_path}/scripts/install-suse-pkgs.sh"
      break
      ;;
    esac
  done

  # Stow dotfiles
  "$dotfiles_path"/scripts/stow-dotfiles.sh "$dotfiles_path"/modules/
}

bootstrap
