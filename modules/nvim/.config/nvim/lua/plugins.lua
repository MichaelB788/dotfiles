vim.pack.add({
  'https://github.com/nvim-mini/mini.pick',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/ellisonleao/gruvbox.nvim',
  'https://github.com/folke/flash.nvim',
}, { confirm = false })

require 'mini.pick'.setup {}
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>gr', ':Pick grep<CR>')
vim.keymap.set('n', '<leader>lg', ':Pick grep_live<CR>')

require 'oil'.setup {}
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

require 'gruvbox'.setup({
  terminal_colors = true,
  contrast = "hard",
  transparent_mode = true,
})
vim.cmd.colorscheme('gruvbox')

require 'flash'.setup {}
vim.keymap.set('n', '<leader>j', '<cmd>lua require"flash".jump()<cr>')
