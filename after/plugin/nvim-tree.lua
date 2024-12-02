local wk = require('which-key')
local api = require('nvim-tree.api')

wk.add({
  { "<leader>n", group = "NvimTree" }, -- Group definition
  { "<leader>nn", api.tree.toggle, desc = "Toggle NvimTree" },
  { "<leader>nf", api.tree.find_file, desc = "Find File in NvimTree" },
  { "<leader>no", api.tree.focus, desc = "Focus NvimTree" },
})

