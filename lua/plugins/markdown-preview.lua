-- return {
--     "iamcco/markdown-preview.nvim",
--     build = function()
--         vim.fn["mkdp#util#install"]()
--     end,
--     config = function()
--         -- Optional: Add configuration settings for markdown-preview.nvim
--     end,
-- }
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
