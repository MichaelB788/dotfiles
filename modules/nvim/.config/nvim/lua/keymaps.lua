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
local term_buf = nil

vim.keymap.set("n", "<C-t>", function()
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.cmd[[tabnew]]
    vim.api.nvim_win_set_buf(0, term_buf)
    vim.cmd[[startinsert]]
  else
    vim.cmd[[tabnew | terminal]]
    term_buf = vim.api.nvim_get_current_buf()
    vim.cmd[[startinsert]]
  end
end)

vim.keymap.set("t", "<C-t>", [[<C-\><C-n>:hide<CR>]])

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
