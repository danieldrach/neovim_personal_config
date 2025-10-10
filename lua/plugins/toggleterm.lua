return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 80,
            open_mapping = [[<F12>]],
            direction = 'float',
            float_opts = {
                border = 'curved',
                width = 80,
                height = 80,
            },
        })
    end,
}
