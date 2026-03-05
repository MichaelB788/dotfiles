#!/bin/bash

set -euo pipefail

install_vim_plugins() {
  if ! command -v vim >/dev/null 2>&1; then
    echo "Could not find vim binary. Consider installing it with your package manager."
    exit 1
  fi

  local plugins_dir="$HOME/.vim/pack/plugins/start/"

  # install plugins here
  local plugins=(
    https://github.com/junegunn/fzf.vim.git
  )

  for plug in "${plugins[@]}"; do
    name=${plug##*/}
    name=${name%.git}
    dir="${plugins_dir}/${name}"

    if [ ! -d "${dir}" ]; then
      git clone "$plug" "$dir"
    fi
  done
}

install_vim_plugins
