return {
    "voldikss/vim-floaterm",
    config = function()
        -- Optional: Add your custom configuration for Floaterm here
        vim.g.floaterm_keymap_toggle = '<F12>'
        vim.g.floaterm_keymap_new    = '<F13>'
        vim.g.floaterm_width         = 0.8
        vim.g.floaterm_height        = 0.8
    end,
}
