return {
	-- Treesitter
  {
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate"
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
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
    },
  },
}
