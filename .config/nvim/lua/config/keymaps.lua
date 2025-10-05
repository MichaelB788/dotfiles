vim.g.mapleader = ' '
local km = vim.keymap

-- write and quit
km.set('n', '<C-s>', '<cmd>wa<CR>', { desc = 'Save file'} )
km.set('n', '<leader>q', '<cmd>q!<CR>', { desc = 'Close file'} )

-- system clipboard
km.set('n', 'p', '"+p', { desc = 'Paste content from system clipboard' })
km.set('v', 'y', '"+y', { desc = 'Yank to system clipboard' })
km.set('n', 'yy', '"+yy', { desc = 'Yank line to system clipboard' })
km.set('v', 'd', '"+d', { desc = 'Cut to system clipboard' })
km.set('n', 'dd', '"+dd', { desc = 'Cut line to system clipboard' })

-- windows (not the microsoft kind)
km.set('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
km.set('n', '<leader>sv', '<cmd>vsp<CR>', { desc = 'Split window vertically' })
km.set('n', '<leader>sh', '<cmd>sp<CR>', { desc = 'Split window horizontally' })

-- window nav
km.set('n', '<leader>wh', '<C-w>h', { desc = 'Move to left window' })
km.set('n', '<leader>wj', '<C-w>j', { desc = 'Move to window below' })
km.set('n', '<leader>wk', '<C-w>k', { desc = 'Move to window above' })
km.set('n', '<leader>wl', '<C-w>l', { desc = 'Move to right window' })

-- tab nav
km.set('n', '<S-l>', 'gt', { desc = 'Go to next tab' })
km.set('n', '<S-h>', 'gT', { desc = 'Go to previous tab' })

-- lsp nav
km.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
km.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
km.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
km.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })

-- lsp tools
km.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover information' })
km.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show signature help' })
km.set('n', '<leader>td', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
km.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
km.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Show code actions' })
