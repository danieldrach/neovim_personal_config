return {
    "salkin-mada/openscad.nvim",
    config = function()
        vim.g.openscad_load_snippets = true
        require("openscad")

        -- Set commentstring for OpenSCAD
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "openscad",
            callback = function()
                vim.bo.commentstring = "// %s"
            end,
        })
    end,
    dependencies = { "L3MON4D3/LuaSnip", "junegunn/fzf.vim" },
}
