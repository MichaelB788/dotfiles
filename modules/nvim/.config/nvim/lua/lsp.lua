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
    'basedpyright',
  },
  auto_update = true,
  run_on_start = true,
}

-- LSP Servers
local servers = {
  clangd = {},
  rust_analyzer = {},
  lua_ls = {},
  based_pyright = {},
}

-- Enable LSP capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for name, server in pairs(servers) do
  server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attatch', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    -- Go to implementation (only for filetypes which support it)
    if client:supports_method('textDocument/implementation') then
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    end

    -- Go to defintion
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

    -- Rename token under cursor
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

    -- LSP format
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

    -- Code Actions
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

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
