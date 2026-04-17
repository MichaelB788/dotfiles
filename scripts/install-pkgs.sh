#!/usr/bin/env bash

set -e

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

if command -v pacman >/dev/null 2>&1; then
  sudo pacman -Syu
  xargs -a "${SCRIPT_PATH}/arch-deps.txt" sudo pacman -S --needed
elif command -v xbps >/dev/null 2>&1; then
  sudo xbps-install -Su
  xargs -a "${SCRIPT_PATH}/void-deps.txt" sudo xbps-install -S
fi
