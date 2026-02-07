vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}, { confirm = false })
require('mason').setup()

-- Ensure the servers and tools above are installed
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'lua-language-server',
  'stylua',
  'clangd',
  'clang-format',
  'rust-analyzer',
})

require('mason-tool-installer').setup {
  ensure_installed = ensure_installed,
  auto_update = true,
  run_on_start = true,
}

-- Enable the following language servers
-- See `:help lsp-config` for information about keys and how to configure
vim.lsp.enable({ "clangd", "rust_analyzer", "lua_ls" })
vim.lsp.config("clangd", {
  capabilities = {
    textDocument = {
      willSaveWaitUntil = 1000
    }
  }
})
