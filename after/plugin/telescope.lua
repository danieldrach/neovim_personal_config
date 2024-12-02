local builtin = require('telescope.builtin')
local wk = require('which-key')

-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

wk.add({ -- GERA ERRO NO CHECKHEALTH, O SEGUNDO ELEMENTO DEVE SER STRING ?!
  { "<leader>f", group = "TelescopeFuzzyFind" }, -- Group definition
  { "<leader>fb", builtin.buffers, desc = "Find in Buffers" },
  { "<leader>ff", builtin.find_files, desc = "Find in Files" },
  { "<leader>fg", builtin.live_grep, desc = "Find Live Grep" },
  { "<leader>fh", builtin.help_tags, desc = "Find Help Tags" },
})

