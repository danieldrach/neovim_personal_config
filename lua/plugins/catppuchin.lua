return {
    "catppuccin/nvim",
    name = "catppuccin", -- Alias for the plugin
    config = function()
        vim.cmd("colorscheme catppuccin-mocha") -- Set the colorscheme
    end,
}
