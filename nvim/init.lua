-- Disable netrw for Nvim Tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy and Treesitter
require("config.lazy")

require("lazy").setup({
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
})

require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
        "c",
        "c_sharp",
        "cpp",
        "python",
        "lua",
        "typescript",
        "rust",
    },

    auto_install = true,

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
}

-- LSP Zero
local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = false,
    suggest_lsp_servers = true,
})

-- Configure lua language server for neovim
lsp.nvim_workspace()
lsp.setup()

-- Lualine
require("lualine").setup{}

-- Nvim Tree
require("nvim-tree").setup()

-- Options
require("config.options")
require("config.keymaps")
