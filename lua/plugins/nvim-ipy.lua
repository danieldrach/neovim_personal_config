return {
    "bfredl/nvim-ipy",
    ft = "python",
    build = ":UpdateRemotePlugins",
    config = function()
        -- Optional: Add any configuration needed for nvim-ipy
        vim.g.ipy_celldef = '# %%' -- Example cell definition marker
    end,
}
