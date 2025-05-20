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
    provider = "claude",
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o",
      timeout = 30000,
      temperature = 0,
      max_completion_tokens = 8192,
      api_key = vim.env.OPENAI_API_KEY,
    },
    anthropic = {
      endpoint = "https://api.anthropic.com/v1",
      model = "claude-3-7-sonnet-20250219",
      timeout = 30000,
      temperature = 0,
      max_tokens = 8192,
      api_key = vim.env.ANTHROPIC_API_KEY,
    },
  },
}

