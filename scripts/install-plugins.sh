#!/bin/bash

install_neovim_plugins() {
  # Mason
  mkdir -p $HOME/.config/nvim/pack/mason/start/
  (cd $HOME/.config/nvim/pack/mason/start/ && git clone https://github.com/mason-org/mason.nvim.git)

  # fzf vim
  mkdir -p $HOME/.config/nvim/pack/fzf/start/
  (cd $HOME/.config/nvim/pack/fzf/start/ && git clone https://github.com/junegunn/fzf.vim.git)
}

install_vim_plugins() {
  # fzf vim
  mkdir -p $HOME/.vim/pack/fzf/start/
  (cd $HOME/.vim/pack/fzf/start/ && git clone https://github.com/junegunn/fzf.vim.git)
}

case "${1}" in
--n) install_neovim_plugins ;;
--v) install_vim_plugins ;;
--nv) 
  install_vim_plugins
  install_neovim_plugins
;;
'' | *)
	echo "Usage: ./install-plugins.sh <flag>"
	echo "Flags:"
	echo "--n -> Neovim plugins"
	echo "--v -> Vim plugins"
	echo "--nv -> Both Neovim and vim plugins"
	;;
esac
