return {
    -- lsp-config
    -- For all the information you need to learn about LSP's, type
    -- :help lspconfig-all
    -- :help ins-completion
    {
        -- Helper plugin to support vim globals along with lua_ls
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },

        -- Install LSP's here!
        config = function()
            vim.lsp.enable('lua_ls')  -- Lua
            vim.lsp.enable('clangd')  -- C / C++
            vim.lsp.enable('pyright') -- Python
            vim.lsp.enable('bashls')  -- bash files
            vim.lsp.enable('shfmt')   -- shell files
        end,
    },

    {
        -- nvim-cmp
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
    },
}
