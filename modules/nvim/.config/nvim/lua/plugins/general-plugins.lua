local gh = function(x) return 'https://github.com/' .. x end

-- Colorscheme
vim.pack.add({gh('miikanissi/modus-themes.nvim')}, {confirm = false})
vim.pack.add({gh('ellisonleao/gruvbox.nvim')}, {confirm = false})
require("gruvbox").setup({
  terminal_colors = true,
  contrast = "hard",
  transparent_mode = false,
})
vim.cmd.colorscheme('gruvbox')

-- Lazygit
vim.pack.add({gh('kdheepak/lazygit.nvim')}, {confirm = false})
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>')

-- Flash
vim.pack.add({gh('folke/flash.nvim')}, {confirm = false})
require('flash').setup{}

-- Lualine
vim.pack.add({gh('nvim-tree/nvim-web-devicons')}, {confirm = false})
vim.pack.add({gh('nvim-lualine/lualine.nvim')}, {confirm = false})
require('lualine').setup()
