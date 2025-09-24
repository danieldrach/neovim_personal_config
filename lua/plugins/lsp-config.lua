return {
    {
        'neovim/nvim-lspconfig',
        dependencies={
          {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
              library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
          },
        },
        config=function()

            local remap = require("configs.remap")

            local fn_on_attach = function(client, bufnr)
              remap.lsp_mappings(bufnr) -- Call the remap function defined in remap.lua
            end

            -- Initialize lspconfig so its server configs are added to the runtimepath
            require('lspconfig')

            -- Global defaults for all language servers
            vim.lsp.config('*', {
                on_attach = fn_on_attach,
            })

            -- Server-specific overrides
            vim.lsp.config('pyright', {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = 'off'
                        }
                    }
                }
            })

            vim.lsp.config('gopls', {
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                },
            })

            -- Enable desired language servers
            vim.lsp.enable({ 'lua_ls', 'pyright', 'gopls' })

        end,
    }
}
