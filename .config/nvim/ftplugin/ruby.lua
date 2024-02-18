vim.opt_local.iskeyword:append({'!', '?'})
vim.keymap.set("n", "gd", function()
  local opts = {}
  opts.search = "^" .. vim.fn.expand("<cword>") .. "$"
  opts.path_display = { truncate = true, filename_first = { reverse_directories = true } }
  opts.layout_strategy = "vertical"
  require("telescope.custom.taglist")(opts)
end, { desc = "ctags", buffer = true })
