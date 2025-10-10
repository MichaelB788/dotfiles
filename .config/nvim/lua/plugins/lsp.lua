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
			vim.lsp.enable({
				"clangd",
			})
		end,
	},

	-- autocomplete
	{
		'hrsh7th/nvim-cmp',
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" }
				},
				mapping = cmp.mapping.preset.insert({
					-- Navigate between completion items
					['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
					['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

					-- `Enter` key to confirm completion
					['<CR>'] = cmp.mapping.confirm({select = false}),

					-- Ctrl+Space to trigger completion menu
					['<C-Space>'] = cmp.mapping.complete(),

					-- Scroll up and down in the completion documentation
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				}
			})
		end,
	},

---- snippets
--{
--	"L3MON4D3/LuaSnip",
--	-- follow latest release.
--	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--	-- install jsregexp (optional!).
--	build = "make install_jsregexp",
--	dependencies = { "rafamadriz/friendly-snippets" },
--},
}
