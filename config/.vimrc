set nocompatible              " be iMproved, required
filetype off                  " required

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4 smarttab
set expandtab

let mapleader = " "    
set autoindent
set mouse=a

" Normal Mode
nnoremap yy     	    "+Y
nnoremap <leader>q      :qa!<Enter>
nnoremap <leader>w      :w<Enter>

" Visual Mode
xnoremap y "+y
