-- For help on key notation, type :h key-notation
-- Globals
vim.g.mapleader = " " -- Map leader
local km = vim.keymap

-- System clipboard
km.set("n", "yy", '"+Y') -- Yank line into system clipboard
km.set("v", "y", '"+y')  -- Yank selected into system clipboard
km.set("v", "d", '"+d"') -- Cut selected into system clipboard
km.set("n", "p", '"+p')  -- Paste from system clipboard below the cursor
km.set("n", "P", '"+P')  -- Paste from system clipboard above the cursor

-- File management
km.set("n", "<leader>w", "<cmd>wa!<CR>") -- Save all files
km.set("n", "<leader>q", "<cmd>q!<CR>")  -- Force quit the current tab

-- Window/Tab management
km.set("n", "<leader>tn", "<cmd>tabnew<CR>") -- Open a new tab
km.set("n", "<leader>sp", "<cmd>vsplit<CR>") -- Perform vertical split

-- Navigation
km.set("n", "w", "<C-w>")  -- Pretense to window navigation
km.set("n", "<S-l>", "gt") -- Go to next tab
km.set("n", "<S-h>", "gT") -- Go to next tab

-- Code / LSP
km.set('n', 'gD', vim.lsp.buf.declaration)                    -- Go to declaration
km.set('n', 'gd', vim.lsp.buf.definition)                     -- Go to definition
km.set('n', 'K', vim.lsp.buf.hover)                           -- Toggle Hover
km.set('n', 'gi', vim.lsp.buf.implementation)                 -- Show implementation
km.set('n', '<C-k>', vim.lsp.buf.signature_help)              -- Show signature
km.set('n', '<leader>aw', vim.lsp.buf.add_workspace_folder)   -- Add a workspace folder
km.set('n', '<space>rw', vim.lsp.buf.remove_workspace_folder) -- Remove a workspace folder
km.set('n', '<space>D', vim.lsp.buf.type_definition)          -- Find the type definition 
km.set('n', '<space>rn', vim.lsp.buf.rename)                  -- Rename a token
km.set('n', '<space>ca', vim.lsp.buf.code_action)             -- List code actions
km.set('n', 'gr', vim.lsp.buf.references)                     -- Go to references
km.set('n', '<space>f', vim.lsp.buf.format)                   -- Format the file
