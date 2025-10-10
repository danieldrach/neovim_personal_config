return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { 
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig"
        },
        config = function()
            require("mason-lspconfig").setup({
                -- Automatically install these LSP servers
                ensure_installed = {
                    "lua_ls",
                    "pyright", 
                    "gopls",
                    -- Add more as needed
                    "html",
                    "cssls",
                    "jsonls",
                    "yamlls",
                },
                -- Automatically enable installed servers
                automatic_enable = true,
            })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "debugpy" },
                automatic_installation = true,
            })
        end,
    },
}
