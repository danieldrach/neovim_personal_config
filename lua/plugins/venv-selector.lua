return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    event = "VeryLazy",
    branch = "main",
    config = function()
      local cmd
      if vim.fn.has("win32") == 1 then
        cmd = "fd -g 'python.exe' $CWD -I -a -L"
      else
        cmd = "fd -g 'python' $CWD -I -a -L"
      end

      require("venv-selector").setup({
        search = {
          cwd = {
            command = cmd,
          },
        },
        options = {
          set_environment_variables = true,
        },
      })
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
}
