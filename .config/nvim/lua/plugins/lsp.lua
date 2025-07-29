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
				"basedpyright",
				"bashls",
				"emmet_language_server"
			})
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
