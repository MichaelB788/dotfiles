local o = vim.o

vim.diagnostic.config({virtual_text = true}) -- Enables diagnostics to appear next to code
vim.cmd.colorscheme "catppuccin-mocha"

-- Changes working directory to the directory opened in nvim
-- o.autochdir     = true

-- tabs & indent
o.tabstop       = 2
o.shiftwidth    = 2
o.expandtab     = false
o.autoindent    = true

-- line numbers
o.number         = true
o.relativenumber = true

-- line wrapping
o.wrap          = false

-- appearance
o.termguicolors = true
o.signcolumn    = "yes"

-- backspace
o.backspace     = "indent,eol,start"

-- split windows
o.splitright    = true
o.splitbelow    = true
