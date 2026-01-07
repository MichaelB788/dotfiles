set nocompatible              " be iMproved, required
filetype off                  " required
set clipboard=unnamedplus
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" == Plugins ==

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your plugins here
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let $FZF_DEFAULT_COMMAND = 'fd --hidden --follow --exclude .git'

" =================

" == Options ==

let mapleader = " "
set autoindent

" tabs & indent
set tabstop=2
set shiftwidth=2 smarttab
set expandtab

" lines
set scrolloff=999
set number
set relativenumber
set wrap
set linebreak

" backspace
set backspace=indent,eol,start

" split windows
set splitright
set splitbelow

" =================

" == Keymaps ==

nmap <C-s> :wa<CR>

" Tabs and splits
nmap <leader>tn :tabnew<CR>
nmap <leader>sv :vsp<CR>
nmap <leader>sh :sp<CR>

" Window resizing
nmap = :vertical resize +5<CR>
nmap - :vertical resize -5<CR>
nmap + :horizontal resize +2<CR>
nmap _ :horizontal resize -2<CR>

" Window navigation
nmap <leader>wh <C-w>h
nmap <leader>wj <C-w>j
nmap <leader>wk <C-w>k
nmap <leader>wl <C-w>l

" Tab navigation
nmap <S-l> gt
nmap <S-h> gT

" Fuzzy finder
nmap <leader>ff :Files .<CR> 
nmap <leader>fg :GFiles<CR> 

" Lazygit
nmap <leader>gg :!lazygit<CR><CR>

" =================
