-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd.colorscheme "catppuccin-macchiato"
require("mason-tool-installer").setup({
	ensure_installed = {
		"clangd",
		"clang-format",
		"codelldb",
	},
	auto_update = true,
	run_on_start = true,
})
