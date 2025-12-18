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

km.set("n", "=", '<cmd>vertical resize +5<cr>')
km.set("n", "-", '<cmd>vertical resize -5<cr>')
km.set("n", "+", '<cmd>horizontal resize +2<cr>')
km.set("n", "_", '<cmd>horizontal resize -2<cr>')


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

-- nvim.dap
local dap = require('dap')
km.set('n', '<F5>', dap.continue, { desc = 'DAP: Continue' })
km.set('n', '<F6>', dap.step_over, { desc = 'DAP: Step Over' })
km.set('n', '<F7>', dap.step_into, { desc = 'DAP: Step Into' })
km.set('n', '<F8>', dap.step_out, { desc = 'DAP: Step Out' })
km.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
km.set('n', '<Leader>B', function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'DAP: Set Conditional Breakpoint' })
km.set('n', '<Leader>lp', function()
    dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, { desc = 'DAP: Set Log Point' })
km.set('n', '<Leader>dr', dap.repl.open, { desc = 'DAP: Open REPL' })
km.set('n', '<Leader>dl', dap.run_last, { desc = 'DAP: Run Last Configuration' })
