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
                path = vim.fn.getcwd(),
                -- Only look for common virtual environment directory names
                name_patterns = {
                    'venv',
                    '.venv',
                    'env',
                    '.env',
                    'virtualenv',
                },
                search_dirs = {
                    -- Exclude common directories that are not needed
                    '.git',
                    '.idea',
                    '.vscode',
                    '__pycache__',
                    'node_modules',
                    'build',
                    'dist',
                    'target',
                    'out',
                    'bin',
                    'obj',
                    'logs',
                    'log',
                    'tmp',
                    'temp',
                    'cache',
                    '.cache',
                },
                search_method = "telescope",
                search_depth = 2, -- Limit search depth to 2 levels
                -- Enable caching to avoid repeated searches
                cache_enabled = true,
                cache_timeout = 86400, -- 24 hours in seconds
                -- Optimize telescope configuration for faster searches
                telescope_opts = {
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.5,
                        height = 0.5,
                    },
                    sorting_strategy = "ascending",
                    results_title = "Virtual Environments",
                    prompt_title = "Select Virtual Environment",
                },
            })
        end,
        keys = {
          { ",v", "<cmd>VenvSelect<cr>" },
        },
    },
}
