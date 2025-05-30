require('configs.lazy')
require('configs.remap')

vim.opt.number = true       -- Absolute line number
vim.opt.relativenumber = true -- Relative line numbers
vim.o.wrap = false -- Enables horizontal scrolling, without this text is broken when it is longer than the screen

vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.tabstop = 4        -- Number of spaces that a tab represents
vim.opt.shiftwidth = 4     -- Number of spaces for autoindent
vim.opt.softtabstop = 4    -- Number of spaces for a <Tab> press

vim.opt.scrolloff = 8 -- makes it so your cursor never reaches the end of the screen
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.mousemodel = 'extend' -- makes is to the mouse button clicks only deal with text selection, not any funky menus
vim.opt.clipboard:append('unnamedplus') -- links the yank register in nvim with the system's clipboard

vim.opt.splitbelow = true -- Open horizontal splits below
vim.opt.splitright = true -- Open vertical splits to the right
vim.opt.smoothscroll = true 

-- ########### THEMES #############
-- vim.cmd("colorscheme catppuccin-mocha") -- Apply Catppuccin Mocha
-- vim.cmd("colorscheme gruvbox")          -- Apply Gruvbox
-- vim.cmd("colorscheme tokyonight")       -- Apply TokyoNight
-- vim.cmd("colorscheme rose-pine")        -- Apply Rose Pine
vim.cmd("colorscheme kanagawa")         -- Apply Kanagawa
vim.api.nvim_set_hl(0, "Visual", { bg = "#544265" }) -- selection color in visual mode, very light purple, goes reasonably well with kanegawa
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#90c4d4", bg = "NONE" }) -- light blue line shows up for separation between the windows in vsplit

-- setting the default terminal for windows and linux
if vim.fn.has("win32") == 1 then
    vim.g.floaterm_shell = "powershell" -- or "C:/Program Files/Git/bin/bash.exe"
else
    vim.g.floaterm_shell = vim.o.shell -- Use default shell on Linux
end

-- Disable swapfile usage
vim.opt.swapfile = false

