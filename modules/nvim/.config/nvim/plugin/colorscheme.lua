vim.pack.add({ "https://github.com/ribru17/bamboo.nvim" }, { confirm = false })

-- Default options:
require('bamboo').setup {
  style = 'vulgaris',                                       -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
  toggle_style_list = { 'vulgaris', 'multiplex', 'light' }, -- List of styles to toggle between
  transparent = true,                                       -- Show/hide background
  dim_inactive = false,                                     -- Dim inactive windows/buffers
  term_colors = true,                                       -- Change terminal color as per the selected theme style
  ending_tildes = false,                                    -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false,                             -- reverse item kind highlights in cmp menu

  -- Change code style ---
  -- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
  -- You can also configure styles with a string, e.g. keywords = 'italic,bold'
  code_style = {
    comments = { italic = false },
    conditionals = { italic = false },
    keywords = {},
    functions = {},
    namespaces = { italic = false },
    parameters = { italic = false },
    strings = {},
    variables = {},
  },

  -- Plugins Config --
  diagnostics = {
    darker = false,    -- darker colors for diagnostic
    undercurl = true,  -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}

-- setup must be called before loading
vim.cmd [[colorscheme bamboo]]
