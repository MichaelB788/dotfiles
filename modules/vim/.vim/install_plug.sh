#!/bin/bash

# install plugins here
plugins=(
  https://github.com/junegunn/fzf.vim.git
)
plugin_dir="$HOME/.vim/pack/plugins/start/"

for plug in "${plugins[@]}"; do
  name=${plug##*/}
  name=${name%.git}
  dir="$plugin_dir/$name"

  if [ ! -d "${dir}" ]; then
    git clone "$plug" "$dir"
  fi
done
