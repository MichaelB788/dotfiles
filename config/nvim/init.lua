-- Disable netrw for Nvim Tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy
require("config.lazy")

-- Treesitter configs
require'nvim-treesitter.configs'.setup{
    ensure_installed = {
        "c",
        "c_sharp",
        "cpp",
        "bash",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
    },

    auto_install = true,

    highlight = { enable = true, },

    indent = { enable = true, },
}

-- Lualine
require("lualine").setup({})

-- Options
require("config.options")
require("config.keymaps")
