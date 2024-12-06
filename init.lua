require('configs.lazy')
require('configs.remap')

vim.opt.number = true       -- Absolute line number
vim.opt.relativenumber = true -- Relative line numbers

vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.tabstop = 4        -- Number of spaces that a tab represents
vim.opt.shiftwidth = 4     -- Number of spaces for autoindent
vim.opt.softtabstop = 4    -- Number of spaces for a <Tab> press

vim.opt.scrolloff = 8 -- makes it so your cursor never reaches the end of the screen
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.mousemodel = 'extend'
vim.opt.clipboard:append('unnamedplus')

-- ########### THEMES #############
-- vim.cmd("colorscheme catppuccin-mocha") -- Apply Catppuccin Mocha
-- vim.cmd("colorscheme gruvbox")          -- Apply Gruvbox
-- vim.cmd("colorscheme tokyonight")       -- Apply TokyoNight
-- vim.cmd("colorscheme rose-pine")        -- Apply Rose Pine
vim.cmd("colorscheme kanagawa")         -- Apply Kanagawa
