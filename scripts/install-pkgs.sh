#!/usr/bin/env bash

set -euo pipefail

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

# Install packages
if command -v pacman >/dev/null; then
  sudo pacman -Syu
  xargs -a "${SCRIPT_PATH}/arch-deps.txt" sudo pacman -S --needed
elif command -v xbps-install >/dev/null; then
  sudo xbps-install -Su
  xargs -a "${SCRIPT_PATH}/void-deps.txt" sudo xbps-install
fi
