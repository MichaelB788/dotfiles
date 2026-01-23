local gh = function(x) return 'https://github.com/' .. x end

-- Colorscheme
vim.pack.add({ gh('rebelot/kanagawa.nvim') }, { confirm = false })
vim.cmd.colorscheme('kanagawa-dragon')

-- Telescope
vim.pack.add({
  gh('nvim-telescope/telescope.nvim'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-telescope/telescope-fzf-native.nvim'),
}, { confirm = false })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Lazygit
vim.pack.add({ gh('kdheepak/lazygit.nvim') }, { confirm = false })
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>')
