-- For help on key notation, type :h key-notation
-- Globals
vim.g.mapleader = " " -- Map leader
local km = vim.keymap

km.set("n", "<leader>w", "<cmd>w<CR>")
km.set("n", "<leader>q", "<cmd>q!<CR>")

-- Window/Tab management
km.set("n", "<leader>tn", "<cmd>tabnew<CR>") -- Open a new tab
km.set("n", "<leader>sp", "<cmd>vsplit<CR>") -- Perform vertical split

-- Navigation
km.set("n", "w", "<C-w>")  										-- Pretense to window navigation
km.set("n", "<S-l>", "gt") 										-- Go to next tab
km.set("n", "<S-h>", "gT") 										-- Go to prev tab
km.set('n', 'gD', vim.lsp.buf.declaration)		-- Go to declaration
km.set('n', 'gd', vim.lsp.buf.definition)			-- Go to definition
km.set('n', 'gi', vim.lsp.buf.implementation)	-- Go to implementation
km.set('n', 'gr', vim.lsp.buf.references)			-- Go to references

-- Code
km.set('n', 'K', vim.lsp.buf.hover)															-- Toggle Hover
km.set('n', '<C-k>', vim.lsp.buf.signature_help)								-- Show signature
km.set('n', '<leader>aw', vim.lsp.buf.add_workspace_folder)			-- Add a workspace folder
km.set('n', '<leader>rw', vim.lsp.buf.remove_workspace_folder)	-- Remove a workspace folder
km.set('n', '<leader>td', vim.lsp.buf.type_definition)					-- Find the type definition 
km.set('n', '<leader>rn', vim.lsp.buf.rename)										-- Rename a token
km.set('n', '<leader>ca', vim.lsp.buf.code_action)							-- List code actions
