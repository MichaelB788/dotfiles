local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('neovim/nvim-lspconfig'),
  gh('mason-org/mason.nvim'),
  gh('mason-org/mason-lspconfig.nvim'),
  gh('WhoIsSethDaniel/mason-tool-installer.nvim'),
}, { confirm = false })
require('mason').setup()
require('mason-tool-installer').setup {
  ensure_installed = {
    'clangd',
    'clang-format',
  },
  auto_update = true,
  run_on_start = true,
}

-- Clangd
vim.lsp.enable('clangd')
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('clangd', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
    map({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, 'Code actions')
    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'K', vim.lsp.buf.hover, 'Toggle hover')
    map('n', '<leader>e', vim.diagnostic.setloclist, 'Open diagnostics')
    map ('n', '<leader>uh', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, 'Toggle inlay hints')

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
      and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('clangd', {clear=false}),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
