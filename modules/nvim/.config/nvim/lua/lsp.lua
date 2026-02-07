vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}, { confirm = false })
require('mason').setup()

require('mason-tool-installer').setup {
  ensure_installed = {
    'lua-language-server',
    'stylua',
    'clangd',
    'clang-format',
    'rust-analyzer',
  },
  auto_update = true,
  run_on_start = true,
}

-- Enable the following language servers
-- See `:help lsp-config` for information about keys and how to configure
vim.lsp.enable({ "clangd", "rust_analyzer", "lua_ls" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attatch', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    -- Go to implementation (only for filetypes which support it)
    if client:supports_method('textDocument/implementation') then
      vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation)
    end

    -- Rename token under cursor
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

    -- Go to defintion
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)

    -- LSP format
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
