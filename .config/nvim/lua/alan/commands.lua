local alan = vim.api.nvim_create_augroup("alan", {})
vim.api.nvim_create_autocmd("InsertEnter",
  { group = alan, command = "if (&number || &relativenumber) | set nornu | endif" })
vim.api.nvim_create_autocmd("InsertLeave",
  { group = alan, command = "if (&number || &relativenumber) | set rnu | endif" })
vim.api.nvim_create_autocmd("TextYankPost",
  { group = alan, pattern = "*", command = "lua require('vim.highlight').on_yank()" })
vim.api.nvim_create_user_command("TrimTrailingWhiteSpaces", "%s/\\s\\+$//e", {})
vim.api.nvim_create_user_command("ClearSearch", "let @/ = ''", {})
vim.api.nvim_create_user_command("ToggleHLS", "if (&hls && v:hlsearch) | noh | else | set hls | endif", {})
vim.api.nvim_create_user_command("TermTab", "tabnew +term | set nobuflisted", {})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = alan,
  pattern = "plugins.lua",
  callback = function(args)
    vim.cmd("source " .. args.file)
    require("packer").compile()
  end,
})
