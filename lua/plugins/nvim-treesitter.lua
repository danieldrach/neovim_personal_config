return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Automatically run `:TSUpdate` after installation
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "python", "javascript", "html", "css" }, -- Specify languages
            highlight = {
                enable = true, -- Enable syntax highlighting
            },
            indent = {
                enable = true, -- Enable indentation
            },
        })
    end,
}

