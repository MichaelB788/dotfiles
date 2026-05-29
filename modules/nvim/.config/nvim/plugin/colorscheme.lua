vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" }, { confirm = false })

require "kanagawa".setup {
  transparent = true
}

vim.cmd [[colorscheme kanagawa-dragon]]
