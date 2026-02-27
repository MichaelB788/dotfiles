vim.pack.add({
  "https://github.com/nvim-mini/mini.pick",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/numToStr/FTerm.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/iamcco/markdown-preview.nvim",

  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/garymjr/nvim-snippets",
}, { confirm = false })

require("mini.pick").setup()
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")

require("oil").setup()
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

require("gruvbox").setup({
  transparent_mode = true,
  palette_overrides = {
    bright_green = "#50b59d",
  },
})
vim.cmd.colorscheme("gruvbox")

require("flash").setup()
vim.keymap.set("n", "<leader>j", '<cmd>lua require"flash".jump()<cr>')

vim.keymap.set("n", "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

require("render-markdown").setup()

local cmp = require("cmp")
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  performance = {
    max_view_entries = 10,
  },
  formatting = {
    fields = { "abbr" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({ { name = "nvim_lsp" } }, { { name = "buffer" } }),
})
