return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8", -- Use the specified tag
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
        require("telescope").setup({
            -- Your configuration here
        })
    end,
}
