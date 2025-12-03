local o = vim.o

-- Changes working directory to the directory opened in nvim
-- o.autochdir     = true

-- tabs & indent
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = false
o.autoindent = true

-- line numbers
o.number = true
o.relativenumber = true

-- line wrapping
o.wrap = false
o.linebreak = false

-- appearance
o.termguicolors = true
o.signcolumn = "yes"

-- backspace
o.backspace = "indent,eol,start"

-- split windows
o.splitright = true
o.splitbelow = true
