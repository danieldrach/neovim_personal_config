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
          -- model = "claude-3-7-sonnet-20250219",
           model = "claude-3-5-sonnet-latest",
          -- model = "claude-sonnet-4-0",
          -- model = "claude-sonnet-4-20250514", -- Specific date version
          timeout = 10000,
          extra_request_body={
              temperature = 0,
              max_tokens = 512,
          },
          api_key = vim.env.ANTHROPIC_API_KEY,
          -- disable_tools = true,
        },
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o",
          timeout = 10000,
          extra_request_body = {
            temperature = 0,
            max_tokens = 2048,
          },
          api_key = vim.env.OPENAI_API_KEY,
        },
    },
  },
}

