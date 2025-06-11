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
            require('venv-selector').setup({
                search_workspace = false,
                parents=1,
                name = {"venv", ".venv", "env", ".env"},
                exclude_dirs = { ".git", ".idea", "node_modules", "_pycache_"},
                path = vim.fn.getcwd(),
                search_method = "telescope",
            })
        end,
        keys = {
          { ",v", "<cmd>VenvSelect<cr>" },
        },
    },
}
