return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional
  },
  opts = {
    providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-3-7-sonnet-20250219",
          timeout = 30000,
          extra_request_body={
              temperature = 0,
              max_tokens = 512,
          },  
          -- api_key = vim.env.ANTHROPIC_API_KEY,
          -- disable_tools = true,
        },
    },
  },
}

