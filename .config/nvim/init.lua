-- Disable netrw for Nvim Tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy
require("config.lazy")

-- Options
require("config.options")
require("config.keymaps")
