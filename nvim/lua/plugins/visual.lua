return {
    -- Treesitter/Parser
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
    },
    
    {
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			term_colors = true,
			transparent_background = true,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			integrations = {
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				dropbar = {
					enabled = true,
					color_mode = true,
				},
			},
		},
	},

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
}
