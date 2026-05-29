-- Tabs and splits
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")

-- Resize editors
vim.keymap.set("n", "=", ":vertical resize +5<CR>")
vim.keymap.set("n", "-", ":vertical resize -5<CR>")
vim.keymap.set("n", "+", ":horizontal resize +2<CR>")
vim.keymap.set("n", "_", ":horizontal resize -2<CR>")

-- Tab navigation
vim.keymap.set("n", "<S-l>", "gt")
vim.keymap.set("n", "<S-h>", "gT")

-- Terminal keymaps
vim.keymap.set("n", "<C-t>", '<cmd>vsp | term<CR>a')
vim.keymap.set("t", "<C-t>", '<C-\\><C-n>:quit<CR>')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
