local alan = vim.api.nvim_create_augroup("alan", {})
vim.api.nvim_create_autocmd("InsertEnter", { group = alan, command = "set norelativenumber" })
vim.api.nvim_create_autocmd("InsertLeave", { group = alan, command = "set relativenumber" })
vim.api.nvim_create_autocmd("TextYankPost",
  { group = alan, pattern = "*", command = "lua require('vim.highlight').on_yank()" })
vim.api.nvim_create_autocmd("VimEnter", { group = alan, command = "DirenvExport" })
vim.api.nvim_create_autocmd("DirChanged", { group = alan, command = "DirenvExport" })

vim.api.nvim_create_user_command("TrimTrailingWhiteSpaces", "%s/\\s\\+$//e", {})
vim.api.nvim_create_user_command("ClearSearch", "let @/ = ''", {})
vim.api.nvim_create_user_command("ToggleHLS", "if (&hls && v:hlsearch) | noh | else | set hls | endif", {})
vim.api.nvim_create_user_command("RelSnips", "source ~/.config/nvim/after/plugin/luasnip.lua", {})
vim.api.nvim_create_user_command("TermTab", "tabnew +term | set nobuflisted", {})
