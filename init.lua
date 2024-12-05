vim.opt.number = true       -- Absolute line number
vim.opt.relativenumber = true -- Relative line numbers

vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.tabstop = 4        -- Number of spaces that a tab represents
vim.opt.shiftwidth = 4     -- Number of spaces for autoindent
vim.opt.softtabstop = 4    -- Number of spaces for a <Tab> press

vim.opt.scrolloff = 8 -- makes it so your cursor never reaches the end of the screen
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

--vim.opt.mouse = '' -- disable mouse, that makes it so you can copy through ssh, mouse interacts with the terminal, not with neovim

vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = { { import = "plugins" },}, -- searches in the ./lua/plugins folder and load all the files there
    install = { colorscheme = { "habamax" } },-- colorscheme that will be used when installing plugins.
    checker = { enabled = true }, -- automatically check for plugin updates
})

require('configs.remap')
