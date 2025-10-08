return {
	-- Neo-Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		lazy = false, -- neo-tree will lazily load itself
		---@module "neo-tree"
		---@type neotree.Config?

		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<CR>" },
		},

		opts = {
			window = {
				position = "right",
				width = 25,
				mappings = {
					["w"] = "noop",
					["<enter>"] = "open_with_window_picker",
					["v"] = "open_split",
					["S"] = "noop",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					never_show = {},
				},
			},
		},
	},

	-- Window Picker
	{
		's1n7ax/nvim-window-picker',
		name = 'window-picker',
		event = 'VeryLazy',
		version = '2.*',
		config = function()
			require'window-picker'.setup()
		end,
	},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')
			local actions = require('telescope.actions')

			-- Configure Telescope with custom mappings
			require('telescope').setup({
				defaults = {
					mappings = {
						i = {
							['Enter'] = actions.file_tab,  -- Ctrl+t to open in new tab
						},
						n = {
							['Enter'] = actions.file_tab,  -- Ctrl+t in normal mode too
						},
					},
				},
			})

			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files in working directory' })
			vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find git files' })
			vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope find word' })
		end,
	},
}
