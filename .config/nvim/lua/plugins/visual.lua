return {
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate"
	},

	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
		}
	},

	-- Which fucking key did I map this to
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	}
}
