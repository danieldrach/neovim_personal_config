return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        format = {
          cmdline = { icon = ":" },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",-- Required dependency
      "rcarriga/nvim-notify", -- Optional dependency for notification view
    }
  }
}
