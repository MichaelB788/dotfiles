-- Terminal 
vim.keymap.set('n', '<leader>tr', ':bo term <CR>a')

-- Writing all files
vim.keymap.set('n', '<C-s>', ':wa<CR>')

-- Tabs and splits
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<leader>sv', ':vsp<CR>')
vim.keymap.set('n', '<leader>sh', ':sp<CR>')

-- Resize editors
vim.keymap.set('n', '=', ':vertical resize +5<CR>')
vim.keymap.set('n', '-', ':vertical resize -5<CR>')
vim.keymap.set('n', '+', ':horizontal resize +2<CR>')
vim.keymap.set('n', '_', ':horizontal resize -2<CR>')

-- Editor navigation
vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wj', '<C-w>j')
vim.keymap.set('n', '<leader>wk', '<C-w>k')
vim.keymap.set('n', '<leader>wl', '<C-w>l')

-- Tab navigation
vim.keymap.set('n', '<S-l>', 'gt')
vim.keymap.set('n', '<S-h>', 'gT')
