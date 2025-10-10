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

            -- Use the new API consistently
            vim.lsp.config('lua_ls', {
                on_attach = fn_on_attach,
            })

            vim.lsp.config('pyright', {
                on_attach = fn_on_attach,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = 'off'
                        }
                    }
                }
            })

            vim.lsp.config('gopls', {
                on_attach = fn_on_attach,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                }
            })

        end,
    }
}
