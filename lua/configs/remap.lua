local wk = require('which-key')

-- vim.keymap.set('n', '<leader>n', vim.cmd.Ex, {desc = 'Open file navigation'})

-- Use the arrow keys to navigate between windows
vim.api.nvim_set_keymap('n', '<Up>', '<C-w>k', { noremap = true, silent = true })    -- Move to the window above
vim.api.nvim_set_keymap('n', '<Down>', '<C-w>j', { noremap = true, silent = true })  -- Move to the window below
vim.api.nvim_set_keymap('n', '<Left>', '<C-w>h', { noremap = true, silent = true })  -- Move to the window on the left
vim.api.nvim_set_keymap('n', '<Right>', '<C-w>l', { noremap = true, silent = true }) -- Move to the window on the right
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true }) -- this is to exit terminal insert mode when it is in a separate window

--vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true }) -- changes buffers with tab

-- Resize splits with arrow keys
vim.api.nvim_set_keymap('n', '<leader><Up>', ':resize +8<CR>', { noremap = true, silent = true, desc = 'win.resize(+)' })
vim.api.nvim_set_keymap('n', '<leader><Down>', ':resize -8<CR>', { noremap = true, silent = true, desc = 'win.resize(-)' })
vim.api.nvim_set_keymap('n', '<leader><Right>', ':vertical resize +8<CR>', { noremap = true, silent = true, desc = 'win.resize(+)' })
vim.api.nvim_set_keymap('n', '<leader><Left>', ':vertical resize -8<CR>', { noremap = true, silent = true, desc = 'win.resize(-)' })

-- ######### OIL FILE NAVIGATOR #########
vim.api.nvim_set_keymap('n', '<leader>d', ":lua require('oil').open('.')<CR>", { noremap = true, silent = true, desc = 'File Nav (Oil)'  })

-- ######### TELESCOPE SEARCH ###########

local builtin = require('telescope.builtin')


-- ######### TELESCOPE REMAPS, MAKING IT ONLY DO GIT TRACKED FILES ###########
wk.add({
  { "<leader>f", group = "TelescopeFuzzyFind" },
  { "<leader>fb", builtin.buffers, desc = "Find in Buffers" },
  { "<leader>ff", function()
      local ok = pcall(builtin.git_files, { show_untracked = true })
      if not ok then
        builtin.find_files()
      end
    end,
    desc = "Find Git Files (fallback to All Files)",
  },
  { "<leader>fg", function()
      builtin.live_grep({
        cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
      })
    end,
    desc = "Grep in Git Repo",
  },
  { "<leader>fh", builtin.help_tags, desc = "Find Help Tags" },
})


-- ######### FUTIGIVE GIT MANAGER ###########
wk.add({
  { "<leader>g", group = "Git/Fugitive" }, -- Group definition
  { "<leader>gs", vim.cmd.Git, desc = "Git Status" },
})

-- ######### FLOATERM ###########
wk.add({
    { "<leader>t", group = "Terminal/Floaterm" }, -- Group definition
    { "<leader>tn", vim.cmd.FloatermNew, desc = "New Terminal" },
    { "<leader>tt", vim.cmd.FloatermToggle, desc = "Toggle Terminal" },
    { "<leader>tx", vim.cmd.FloatermNext, desc = "Next Terminal" },
    { "<leader>tp", vim.cmd.FloatermPrev, desc = "Previous Terminal" },
    { "<leader>tk", vim.cmd.FloatermKill, desc = "Kill Terminal" },
})

-- ######### LSP CODE NAVIGATION ###########
local M = {}

function M.lsp_mappings(bufnr)
  local wk = require("which-key")
  wk.add({
    { "<leader>l", group = 'LSP Code Nav.' },
    { "<leader>ld", function() vim.lsp.buf.definition() end, desc = "Go to Definition", buffer = bufnr },
    { "<leader>lr", function() vim.lsp.buf.references() end, desc = "Find References (to)", buffer = bufnr },
    { "<leader>lh", function() vim.lsp.buf.hover() end, desc = "Hover Documentation", buffer = bufnr },
  })
end

return M
