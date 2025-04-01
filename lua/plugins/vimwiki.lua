return {
  'vimwiki/vimwiki',
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
  end,
}
