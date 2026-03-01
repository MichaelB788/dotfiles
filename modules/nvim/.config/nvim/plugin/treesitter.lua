vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { confirm = false })

local languages = {
  "bash",
  "c",
  "cpp",
  "markdown_inline",
  "markdown",
  "rust",
  "python",
}
require("nvim-treesitter").install(languages)
