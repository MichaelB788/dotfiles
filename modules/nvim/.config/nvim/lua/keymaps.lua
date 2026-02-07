-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Write to all files
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
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Tab navigation
vim.keymap.set('n', '<S-l>', 'gt')
vim.keymap.set('n', '<S-h>', 'gT')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Rename token under cursor
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

-- Go to defintion
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)

-- LSP format
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
}

vim.keymap.set('n', '<leader>xx', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
