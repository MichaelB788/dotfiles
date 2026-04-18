#!/usr/bin/env bash

set -euo pipefail

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null && pwd)

# Install packages
sudo pacman -Syu
xargs -a "${SCRIPT_PATH}/arch-deps.txt" sudo pacman -S --needed
