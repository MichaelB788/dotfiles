vim.pack.add({ "https://github.com/edeneast/nightfox.nvim" }, { confirm = false })

-- Default options
require('nightfox').setup({
  options = {
    transparent = true,     -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
  },
})

vim.cmd [[colorscheme duskfox]]
