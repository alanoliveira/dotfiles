local map = vim.keymap.set

map("n", "<C-b>", "<cmd> NvimTreeToggle<CR>", { desc = "toggle nvim tree" })
map({ "t", "n" }, "<C-h>", "<cmd> lua require('smart-splits').move_cursor_left()<CR>", { desc = "move to left split" })
map({ "t", "n" }, "<C-j>", "<cmd> lua require('smart-splits').move_cursor_down()<CR>", { desc = "move to down split" })
map({ "t", "n" }, "<C-k>", "<cmd> lua require('smart-splits').move_cursor_up()<CR>", { desc = "mode to up split" })
map({ "t", "n" }, "<C-l>", "<cmd> lua require('smart-splits').move_cursor_right()<CR>", { desc = "move to right split" })
map("n", "<space>/", "<cmd> ToggleHLS<CR>", { desc = "toggle hls" })
map("s", "<C-w>", "<BS>i", { desc = "delete word" }) -- used to delete suggestions on luasnip

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
