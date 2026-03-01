vim.pack.add({ "https://github.com/numToStr/FTerm.nvim" }, { confirm = false })

vim.keymap.set("n", "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
