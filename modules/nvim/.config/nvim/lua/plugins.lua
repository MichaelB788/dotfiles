local gh = function(x) return 'https://github.com/' .. x end

-- Colorscheme
vim.pack.add({ gh('miikanissi/modus-themes.nvim') }, { confirm = false })
vim.cmd.colorscheme('modus')

-- Telescope
vim.pack.add({
  gh('nvim-telescope/telescope.nvim'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-telescope/telescope-fzf-native.nvim'),
}, { confirm = false })

local telescope = require('telescope.builtin')

require("telescope").setup{
  pickers = {
    find_files = {
      hidden = true,
      file_ignore_patterns = {
        ".git/",
      },
    },
  },
}

vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })

-- Lazygit
vim.pack.add({ gh('kdheepak/lazygit.nvim') }, { confirm = false })
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>')
