-- Write to all files
vim.keymap.set("n", "<C-s>", ":wa<CR>")

-- Tabs and splits
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>sv", ":vsp<CR>")
vim.keymap.set("n", "<leader>sh", ":sp<CR>")

-- Resize editors
vim.keymap.set("n", "=", ":vertical resize +5<CR>")
vim.keymap.set("n", "-", ":vertical resize -5<CR>")
vim.keymap.set("n", "+", ":horizontal resize +2<CR>")
vim.keymap.set("n", "_", ":horizontal resize -2<CR>")

-- Editor navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Tab navigation
vim.keymap.set("n", "<S-l>", "gt")
vim.keymap.set("n", "<S-h>", "gT")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open diagnostic jumplist
vim.keymap.set("n", "<leader>xx", vim.diagnostic.setloclist)

-- Go to defintion
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- Rename token under cursor
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- Code Actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Find files
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")

-- Seach help files
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")

-- Grep search
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")

-- Flash
vim.keymap.set("n", "<leader>j", ':lua require"flash".jump()<cr>')

-- Terminal keymaps
vim.keymap.set("n", "<C-t>", '<cmd>tabnew | term<CR>a')
vim.keymap.set("t", "<C-t>", '<C-\\><C-n>:quit<CR>')
