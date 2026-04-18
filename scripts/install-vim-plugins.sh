#!/usr/bin/env bash

set -euo pipefail

PLUGINS_PATH="$HOME/.vim/pack/plugins/start/"

git clone https://github.com/junegunn/fzf.vim.git "$PLUGINS_PATH"
