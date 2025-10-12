return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 90,  -- 20% of screen height for regular terminals
            open_mapping = [[<F12>]],
            direction = 'float',
            float_opts = {
                border = 'curved',
                width = math.floor(vim.o.columns * 0.8),  -- 80% of screen width
                height = math.floor(vim.o.lines * 0.6),   -- 60% of screen height
            },
        })
    end,
}
