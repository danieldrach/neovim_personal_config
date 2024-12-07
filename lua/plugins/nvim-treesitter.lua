return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Automatically run `:TSUpdate` after installation
    event = {"BufReadPre","BufNewFile"}, -- lazy loading the plugin only when a new buffer is created or when a file is open into a buffer
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

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            }
        })
    end,
}

