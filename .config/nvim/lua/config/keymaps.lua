vim.g.mapleader = ' '
local km = vim.keymap

-- File manipulation
km.set('n', '<C-s>', '<cmd>wa<CR>', { desc = 'Save file'} )
km.set('n', '<leader>q', '<cmd>q!<CR>', { desc = 'Close file'} )

km.set('n', 'p', '"+p', { desc = 'Paste content from system clipboard' })
km.set('v', 'y', '"+y', { desc = 'Yank to system clipboard' })
km.set('n', 'yy', '"+yy', { desc = 'Yank line to system clipboard' })
km.set('v', 'd', '"+d', { desc = 'Cut to system clipboard' })
km.set('n', 'dd', '"+dd', { desc = 'Cut line to system clipboard' })

-- Tab manipulation
km.set('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
km.set('n', '<leader>sp', '<cmd>vsplit<CR>', { desc = 'Vertical split' })

-- General Navigation
km.set('n', '<S-l>', 'gt', { desc = 'Go to next tab' })
km.set('n', '<S-h>', 'gT', { desc = 'Go to previous tab' })
km.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
km.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
km.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
km.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })

-- LSP Tools
km.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover information' })
km.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show signature help' })
km.set('n', '<leader>td', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
km.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
km.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Show code actions' })
