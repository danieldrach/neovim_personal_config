return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8", -- Use the specified tag
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
        local actions = require("telescope.actions") 
        require("telescope").setup({
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<C-d>"] = actions.delete_buffer,
                        },
                        n = {
                            ["<C-d>"] = actions.delete_buffer,
                        },
                    },
                },
            },
        })
    end,
}
