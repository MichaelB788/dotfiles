#!/bin/bash

echo "
# aliases
alias dot='/usr/bin/git --git-dir=/$HOME/dotfiles/ --work-tree=$HOME'
alias snip='(cd ~/scripts && nvim)'
alias virc='vim ~/.vim/vimrc'
alias conf='(cd ~/.config/nvim/ && nvim)'
alias barc='nvim ~/.bashrc'
alias kico='nvim ~/.config/kitty/kitty.conf'
" >> $HOME/.bashrc
