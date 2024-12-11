return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency
    },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'nord',  -- Automatically adapts to your colorscheme
            },
        }
    end,
  },
}

