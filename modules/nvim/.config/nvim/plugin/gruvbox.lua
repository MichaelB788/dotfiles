vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" }, { confirm = false })

require("gruvbox").setup({
	terminal_colors = true,
	contrast = "hard",
	palette_overrides = {
		bright_orange = "#ffac78",
		bright_yellow = "#ffe878",
		bright_red = "#ffc7ef",
		bright_blue = "#b5e9ff",
		bright_green = "#76DE99",
	},
	transparent_mode = true,
})
vim.cmd.colorscheme("gruvbox")
