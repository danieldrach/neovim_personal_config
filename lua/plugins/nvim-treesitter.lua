return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Automatically run `:TSUpdate` after installation
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "python",
                "javascript",
                "html",
                "css" ,
                "markdown",
                "markdown_inline",
                "yaml",
                "dockerfile",
                "bash",
                "dockerfile",
                "gitignore",
                "query",
                "regex",
                "sql",
                "xml",
                "zig",
                "arduino",
                "cpp",
                "csv",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "json",
                "json5",
                "latex",
            },
     -- Specify languages
            highlight = {
                enable = true, -- Enable syntax highlighting
            },
            indent = {
                enable = true, -- Enable indentation
            },
        })
    end,
}

