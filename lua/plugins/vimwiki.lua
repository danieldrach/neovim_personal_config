return {
  'vimwiki/vimwiki',
  event = "VeryLazy",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
      },
    }
    vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_listsyms = ' ◐✓✘'
    -- vim.g.vimwiki_listsyms = '　🟡✅❌' -- first character is U+3000
    vim.g.vimwiki_global_ext = 0
  end,
}
