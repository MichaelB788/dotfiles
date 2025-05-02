-- For help on key notation, type :h key-notation
-- Globals
vim.g.mapleader = " "                        -- Map leader

local km = vim.keymap;
local telescope = require('telescope.builtin')

-- Plugin-specific
km.set('n', '<leader>ff', telescope.find_files, {})          -- Fuzzy find all files in cwd
km.set('n', '<leader>fg', telescope.git_files, {})           -- Fuzzy find all git files
km.set('n', '<leader>e', ':NvimTreeFindFileToggle<Enter>')   -- Toggle explorer

-- System clipboard
km.set('n', 'yy', '"+Y')                     -- Yank line into system clipboard
km.set('v', 'y', '"+y')                      -- Yank selected into system clipboard
km.set('v', 'd', '"+d"')                     -- Cut selected into system clipboard
km.set('n', 'p', '"+p')                      -- Paste from system clipboard below the cursor
km.set('n', 'P', '"+P')                      -- Paste from system clipboard above the cursor

-- File management
km.set('n', '<leader>w', ':wall<Enter>')     -- Write to all files
km.set('n', '<leader>q', ':q!<Enter>')       -- Force quit the current tab

-- Window/Tab management
km.set('n', '<leader>tn', ':tabnew<Enter>')  -- Open a new tab
km.set('n', '<leader>sp', ':vsplit<Enter>')  -- Perform vertical split

-- Navigation
km.set('n', 'L', 'gt')                       -- Move to left tab
km.set('n', 'H', 'gT')                       -- Move to right tab
km.set('n', 'w', '<C-w>')                    -- Pretense to window navigation
