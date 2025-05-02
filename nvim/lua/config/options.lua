local o = vim.o

vim.diagnostic.config({virtual_text = true}) -- Enables diagnostics to appear next to code
vim.cmd.colorscheme "catppuccin"             -- Colorscheme

-- Changes working directory to the directory opened in nvim
o.autochdir     = true

-- tabs & indent
o.tabstop       = 4
o.shiftwidth    = 4
o.expandtab     = true
o.autoindent    = true

-- line numbers
o.number        = true

-- line wrapping
o.wrap          = false

-- appearance
o.termguicolors = true
o.signcolumn    = "no"

-- backspace
o.backspace     = "indent,eol,start"

-- split windows
o.splitright    = true
o.splitbelow    = true
