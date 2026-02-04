-- Mapleader
vim.g.mapleader=" "
vim.g.localmapleader=" "

-- Disable netrw
vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1

-- Disable swapfile
vim.o.swapfile=false

-- Make line numbers and relative line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Sync clipboard between OS & nvim
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Launch bash shell scripts
vim.o.shellcmdflag="-ic"

-- Highlight column 80
vim.o.textwidth=80
vim.o.colorcolumn="80"

-- Configure how new splits should be opened
vim.o.splitright=true
vim.o.splitbelow=true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the
-- search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the
-- buffer (like `:q`), instead raise a dialog asking if you wish to save the
-- current file(s)
vim.o.confirm = true

-- Tab settings
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.smarttab=true
vim.o.expandtab=true
vim.o.smartindent=true

-- Text
vim.o.wrap=true
vim.o.linebreak=true
vim.o.backspace="indent,eol,start"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
