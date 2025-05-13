return {
    -- Treesitter/Parser
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,

        opts = {
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
    },

    -- catppuccin / colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        opts = {
            lsp_trouble = true,
            dashboard = true,
            neotree = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { "undercurl" },
                    hints = { "undercurl" },
                    warnings = { "undercurl" },
                    information = { "undercurl" },
                },
            },
        },
    },

    -- Lualine / status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
}
