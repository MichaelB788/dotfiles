vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" }, { confirm = false })

require "kanagawa".setup {
  transparent = true,
  theme = "dragon"
}

vim.cmd [[colorscheme kanagawa]]
