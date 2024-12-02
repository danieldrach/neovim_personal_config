local wk = require('which-key')

vim.g.mapleader = ' '
-- vim.keymap.set('n', '<leader>n', vim.cmd.Ex, {desc = 'Open file navigation'})

-- Use the arrow keys to navigate between windows
vim.api.nvim_set_keymap('n', '<Up>', '<C-w>k', { noremap = true, silent = true })    -- Move to the window above
vim.api.nvim_set_keymap('n', '<Down>', '<C-w>j', { noremap = true, silent = true })  -- Move to the window below
vim.api.nvim_set_keymap('n', '<Left>', '<C-w>h', { noremap = true, silent = true })  -- Move to the window on the left
vim.api.nvim_set_keymap('n', '<Right>', '<C-w>l', { noremap = true, silent = true }) -- Move to the window on the right
vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

