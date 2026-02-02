local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('neovim/nvim-lspconfig'),
  gh('mason-org/mason.nvim'),
  gh('mason-org/mason-lspconfig.nvim'),
  gh('WhoIsSethDaniel/mason-tool-installer.nvim'),
  gh('saghen/blink.cmp'),
  gh('L3MON4D3/LuaSnip')
}, { confirm = false })

require('mason').setup()

--  This function gets run when an LSP attaches to a particular buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local bufnr = event.buf

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, 'goto [c]ode [a]ction', { 'n', 'x' })
    map('<leader>gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
    map('<leader>gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
      and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('lsp-attatch', {clear=false}),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 1000 })
        end,
      })
    end

    -- Keymap to toggle inlay hints
    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map('<leader>uh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, '[T]oggle Inlay [H]ints')
    end
  end,
})

require('blink.cmp').setup {
  keymap = {
    preset = 'default',
  },
  completion = {
    -- By default, you may press `<c-space>` to show the documentation.
    -- Optionally, set `auto_show = true` to show the documentation after a delay.
    documentation = { auto_show = false, auto_show_delay_ms = 500 },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'lua' },
  signature = { enabled = true },
}

-- LSP servers and clients are able to communicate to each other what features they support.
--  By default, Neovim doesn't support everything that is in the LSP specification.
--  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Enable the following language servers
-- See `:help lsp-config` for information about keys and how to configure
local servers = {
  clangd = {},
  rust_analyzer = {},
}

-- Ensure the servers and tools above are installed
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'lua_ls',
  'stylua',
  'clangd',
  'clang-format',
  'rust_analyzer',
})

require('mason-tool-installer').setup {
  ensure_installed = ensure_installed,
  auto_update = true,
  run_on_start = true,
}

for name, server in pairs(servers) do
  server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end
