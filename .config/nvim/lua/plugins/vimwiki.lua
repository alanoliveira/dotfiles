return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = vim.env.VIMWIKI_PATH,
        diary_rel_path = "work/diary/",
        syntax = "markdown",
      },
    }

    vim.g.vimwiki_dir_link = "index"
    vim.g.vimwiki_auto_header = 1
    vim.g.auto_toc = 1
    vim.g.links_space_char = "_"
    vim.g.vimwiki_ext2syntax = { [".wiki"] = "media" } -- prevent vimwiki filetype on common .md 
  end,
}
