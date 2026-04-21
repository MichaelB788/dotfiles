#!/usr/bin/env bash

set -euo pipefail

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)
PKGS_PATH="$SCRIPT_PATH/pkgs"

# Install packages
if command -v pacman >/dev/null; then
  sudo pacman -Syu
  xargs -a "${PKGS_PATH}/pacman.txt" sudo pacman -S --needed
elif command -v xbps-install >/dev/null; then
  sudo xbps-install -Su
  xargs -a "${PKGS_PATH}/xbps.txt" sudo xbps-install
elif command -v zypper >/dev/null; then
  sudo zypper dist-upgrade
  xargs -a "${PKGS_PATH}/zypper.txt" sudo zypper install
  # Install stable version of Rust and Cargo
  rustup toolchain install stable
fi
