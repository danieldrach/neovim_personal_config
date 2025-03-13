return {
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap", 
            "mfussenegger/nvim-dap-python", --optional
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        lazy = false,
        branch = "regexp", -- This is the regexp branch, use this for the new version
        config = function()
          require("venv-selector").setup({
             search = {
                patterns = { "venv", ".venv", "env", ".env" }, -- Adjust as needed
                ignore = { "node_modules", ".git", ".cache" }, -- Ignore unnecessary dirs
            },
        })
        end,
        keys = {
          { ",v", "<cmd>VenvSelect<cr>" },
        },
    },
}
