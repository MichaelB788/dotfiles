vim.pack.add({ "https://github.com/metalelf0/black-metal-theme-neovim" }, { confirm = false })

require "black-metal".setup {
  theme = "venom",
  variant = "dark"
}
require "black-metal".load()
