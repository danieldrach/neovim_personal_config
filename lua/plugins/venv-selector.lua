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
        branch = "main", -- This is the regexp branch, use this for the new version
        config = function()
            require('venv-selector').setup({
                {
                  search = {
                    cwd = {
                      command = "fd '/bin/python$' $CWD --full-path --color never -E /proc -I -a -L",
                    },
                  },
                }
            })
        end,
        keys = {
          { ",v", "<cmd>VenvSelect<cr>" },
        },
    },
}
