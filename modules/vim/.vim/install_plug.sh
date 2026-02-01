#!/bin/bash

main() {
  # install plugins here
  plugins_url=(
    https://github.com/junegunn/fzf.vim.git
    https://github.com/kana/vim-operator-user.git
    https://github.com/rhysd/vim-clang-format.git
  )

  for pkg in "${plugins_url[@]}"; do
    repo_name=$(basename -s .git "$pkg")
    dir="$HOME/.vim/pack/plugins/start/$repo_name"

    mkdir -p "$dir"
    git clone "$pkg" "$dir"
  done
}

main ${@}
