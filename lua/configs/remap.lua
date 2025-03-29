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
vim.api.nvim_set_keymap('n', '<leader><Up>', ':resize +8<CR>', { noremap = true, silent = true, desc = 'win.vresize(+)' })
vim.api.nvim_set_keymap('n', '<leader><Down>', ':resize -8<CR>', { noremap = true, silent = true, desc = 'win.vresize(-)' })
vim.api.nvim_set_keymap('n', '<leader><Right>', ':vertical resize +8<CR>', { noremap = true, silent = true, desc = 'win.hresize(+)' })
vim.api.nvim_set_keymap('n', '<leader><Left>', ':vertical resize -8<CR>', { noremap = true, silent = true, desc = 'win.hresize(-)' })
-- wk.add({
--     { "<leader>w", group = "Resize Windows" }, -- Group definition
--     { "<leader>w<Up>", ":resize +8<CR>", desc = "Increase window height" },
--     { "<leader>w<Down>", ":resize -8<CR>", desc = "Decrease window height" },
--     { "<leader>w<Right>", ":vertical resize +8<CR>", desc = "Increase window width" },
--     { "<leader>w<Left>", ":vertical resize -8<CR>", desc = "Decrease window width" },
-- })

-- ######### OIL FILE NAVIGATOR #########
vim.api.nvim_set_keymap('n', '<leader>n', ":lua require('oil').open('.')<CR>", { noremap = true, silent = true, desc = 'File Nav (Oil)'  })

-- ######### FLOATERM REMAPS ###########
wk.add({
    { "<leader>t", group = "Terminal/Floaterm" }, -- Group definition
    { "<leader>tn", vim.cmd.FloatermNew, desc = "New Terminal" },
    { "<leader>tt", vim.cmd.FloatermToggle, desc = "Toggle Terminal" },
    { "<leader>tx", vim.cmd.FloatermNext, desc = "Next Terminal" },
    { "<leader>tp", vim.cmd.FloatermPrev, desc = "Previous Terminal" },
    { "<leader>tk", vim.cmd.FloatermKill, desc = "Kill Terminal" },
})


-- ######### HARPOON REMAPS ###########
local harpoon_mark = require("harpoon.mark")
local harpoon_ui= require("harpoon.ui")

wk.add({
    { "<leader>h", group = "Harpoon" },
    { "<leader>ha", function() harpoon_mark.add_file() end, desc = "Add file to Harpoon" },
    { "<leader>hh", function() harpoon_ui.toggle_quick_menu() end, desc = "Toggle Harpoon Menu" },
    { "<leader>h1", function() harpoon_ui.nav_file(1) end, desc = "Go to Harpoon file 1" },
    { "<leader>h2", function() harpoon_ui.nav_file(2) end, desc = "Go to Harpoon file 2" },
    { "<leader>h3", function() harpoon_ui.nav_file(3) end, desc = "Go to Harpoon file 3" },
    { "<leader>h4", function() harpoon_ui.nav_file(4) end, desc = "Go to Harpoon file 4" },
})


-- ######### TELESCOPE REMAPS, MAKING IT ONLY DO GIT TRACKED FILES ###########
local builtin = require('telescope.builtin')
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

-- ######### VENV SELECTOR ###########
wk.add({ "<leader>v", "<cmd>VenvSelect<CR>", desc = "Select .venv" })

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


-- ######### IPYTHON CELL STYLE EXECUTION FOR PYTHON ###########
-- wk.add({
--     { "<leader>p", group = "IPython" }, -- Group definition
--     { "<leader>ps", vim.cmd.IPython, desc = "Start IPython" },
--     { "<leader>pl", vim.cmd.IPyRun, desc = "Execute current line" },
--     { "<leader>pf", vim.cmd.IPyRunFile, desc = "Execute current file" },
--     { "<leader>ps", function() vim.cmd.normal(":'<,'>IPyRun") end, mode = "v", desc = "Execute selected text" },
--     { "<leader>pc", "<Plug>(IPy-RunCell)", desc = "Execute current cell" },
--     { "<leader>pq", vim.cmd.IPyDisconnect, desc = "Disconnect IPython" },
-- })

wk.add({
    { "<leader>p", group = "IPython" }, -- Group definition
    { "<leader>ps", ":IPython<CR>", desc = "Connect to IPython" },
    { "<leader>pl", "<Plug>(IPy-Run)", desc = "Run line or selection" },
    -- { "<leader>pf", ":IPython --existing<CR>", desc = "Connect to existing IPython session" },
    { "<leader>pf", "<Plug>(IPy-RunAll)", desc = "Run File" },
    { "<leader>pc", "<Plug>(IPy-RunCell)", desc = "Run Current Cell" },
    { "<leader>pq", ":IPython --kill<CR>", desc = "Quit IPython" },
})

return M
