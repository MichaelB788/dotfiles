vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'markdown', 'vim', 'vimdoc', 'python', 'rust', 'c', 'cpp' },
  callback = function()
    vim.treesitter.start()
  end,
})
