return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
  },
  opts = {
    file_types = { "markdown", "vimwiki" },
  },
  config = function(_, opts)
    require("render-markdown").setup({
        checkbox = {
            enabled = true,
            render_modes = false,
            right_pad = 1,
            unchecked = {
                icon = '⬜',
                highlight = 'RenderMarkdownUnchecked',
                scope_highlight = nil,
            },
            checked = {
                icon = '✅',
                highlight = 'RenderMarkdownChecked',
                scope_highlight = nil,
            },
            custom = {
                todo = { raw = '[~]', rendered = '⏳', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                failed = { raw = '[f]', rendered = '❌ ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
            },
        },
    })
    vim.treesitter.language.register("markdown", "vimwiki")
  end,
}
