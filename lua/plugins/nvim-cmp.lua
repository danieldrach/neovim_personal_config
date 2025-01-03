return {
    -- Autocompletion
    { 
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",  -- For LSP completions
            "hrsh7th/cmp-buffer",    -- For buffer text completions
            "hrsh7th/cmp-path",      -- For filesystem path completions
            "hrsh7th/cmp-vsnip",     -- Or "saadparwaiz1/cmp_luasnip" if using LuaSnip
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- Replace with LuaSnip if using it
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- Use LSP completion
                    { name = "buffer" },   -- Use buffer completions
                    { name = "path" },     -- Use path completions
                }),
            })
        end,
    },
}

