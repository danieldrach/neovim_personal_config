local wk = require('which-key')
-- vim.keymap.set('n', '<leader>gs', vim.cmd.Git, {desc = 'GIT Status'});

wk.add({ -- GERA ERRO NO CHECKHEALTH, O SEGUNDO ELEMENTO DEVE SER STRING ?!
  { "<leader>g", group = "Git/Fugitive" }, -- Group definition
  { "<leader>gs", vim.cmd.Git, desc = "Git Status" },
})

