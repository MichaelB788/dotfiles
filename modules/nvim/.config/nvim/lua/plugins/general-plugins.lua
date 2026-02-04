local gh = function(x) return 'https://github.com/' .. x end

-- Colorscheme
vim.pack.add({ gh('miikanissi/modus-themes.nvim') }, { confirm = false })
vim.cmd.colorscheme('modus')

-- Lazygit
vim.pack.add({ gh('kdheepak/lazygit.nvim') }, { confirm = false })
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>')

-- Flash
vim.pack.add({ gh('folke/flash.nvim') }, { confirm = false })
require('flash').setup{}
