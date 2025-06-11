return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    -- Float window configuration
    float = {
      -- Positioning the float window on the left side
      max_width = 60,
      max_height = 0, -- 0 means use vim.o.lines - border_padding * 2
      border = "rounded",
      win_options = {
        winblend = 0, -- Make it fully opaque
      },
      override = function(conf)
        -- Position the window on the left side
        conf.anchor = "NW" -- Northwest anchor
        conf.relative = "editor"
        conf.row = 1
        conf.col = 1
        conf.width = 40 -- Fixed width
        conf.height = vim.o.lines - 4 -- Almost full height
        return conf
      end,
    },
    -- Use floating window by default
    default_file_explorer = false, -- Don't replace netrw by default
    view_options = {
      show_hidden = true, -- Always show hidden files
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}

