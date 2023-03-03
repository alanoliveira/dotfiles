local alan = vim.api.nvim_create_augroup("alan", {})
vim.api.nvim_create_autocmd("InsertEnter",
  { group = alan, command = "if (&number || &relativenumber) | set nornu | endif" })
vim.api.nvim_create_autocmd("InsertLeave",
  { group = alan, command = "if (&number || &relativenumber) | set rnu | endif" })
vim.api.nvim_create_autocmd("TextYankPost",
  { group = alan, pattern = "*", command = "lua require('vim.highlight').on_yank()" })
vim.api.nvim_create_user_command("TrimTrailingWhiteSpaces", "%s/\\s\\+$//e", {})
vim.api.nvim_create_user_command("ClearSearch", "let @/ = ''", {})
vim.api.nvim_create_user_command("TermTab", "tabnew +term | set nobuflisted", {})

vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local keys = { "n", "N", "*", "#", "<CR>", "/", "?" }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, vim.api.nvim_create_namespace("toggle_hlsearch"))

local map = vim.keymap.set

map({ "i" }, "<C-s>", function()
  require "telescope.builtin".symbols { sources = { "nerd", "emoji" } }
end, { desc = "symbol" })
map({ "t", "n" }, "<C-h>", "<cmd> lua require('smart-splits').move_cursor_left()<CR>", { desc = "move to left split" })
map({ "t", "n" }, "<C-j>", "<cmd> lua require('smart-splits').move_cursor_down()<CR>", { desc = "move to down split" })
map({ "t", "n" }, "<C-k>", "<cmd> lua require('smart-splits').move_cursor_up()<CR>", { desc = "mode to up split" })
map({ "t", "n" }, "<C-l>", "<cmd> lua require('smart-splits').move_cursor_right()<CR>", { desc = "move to right split" })
map("s", "<C-w>", "<BS>i", { desc = "delete word" }) -- used to delete suggestions on luasnip

map("x", "<leader>p", [["_dp]], { desc = "p w/o change \" reg" })
map("x", "<leader>P", [["_dP]], { desc = "P w/o change \" reg" })

map("n", "<M-j>", "<esc>:m .+1<CR>", { desc = "move line down" })
map("n", "<M-k>", "<esc>:m .-2<CR>", { desc = "move line up" })
map("v", "<M-j>", ":m '>+1<CR>gv", { desc = "move selection down" })
map("v", "<M-k>", ":m '<-2<CR>gv", { desc = "move selection up" })
