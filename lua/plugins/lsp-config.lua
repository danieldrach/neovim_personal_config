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

            require('lspconfig').lua_ls.setup {
                on_attach = fn_on_attach,
            }
            require('lspconfig').pyright.setup {
                on_attach = fn_on_attach,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = 'off'
                        }
                    }
                }
            }
        end,
    }
}
