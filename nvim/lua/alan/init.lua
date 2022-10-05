local map = vim.keymap.set

map("n", "<C-b>", "<cmd> NvimTreeToggle<CR>", { desc = "toggle nvim tree" })
map({ "t", "n" }, "<C-h>", "<cmd> lua require('smart-splits').move_cursor_left()<CR>", { desc = "move to left split" })
map({ "t", "n" }, "<C-j>", "<cmd> lua require('smart-splits').move_cursor_down()<CR>", { desc = "move to down split" })
map({ "t", "n" }, "<C-k>", "<cmd> lua require('smart-splits').move_cursor_up()<CR>", { desc = "mode to up split" })
map({ "t", "n" }, "<C-l>", "<cmd> lua require('smart-splits').move_cursor_right()<CR>", { desc = "move to right split" })
map("n", "<space>/", "<cmd> ToggleHLS<CR>", { desc = "toggle hls" })
map("s", "<C-w>", "<BS>i", { desc = "delete word" }) -- used to delete suggestions on luasnip

-- Git
map({ "n", "v" }, "<space>gs", "<cmd> :Gitsigns stage_hunk<CR>", { desc = "stage hunk" })
map({ "n", "v" }, "<space>gr", ":Gitsigns reset_hunk<CR>", { desc = "reset hunk" })
map("n", "<space>gS", require("gitsigns").stage_buffer, { desc = "stage buffer" })
map("n", "<space>gu", require("gitsigns").undo_stage_hunk, { desc = "undo stage hunk" })
map("n", "<space>gR", require("gitsigns").reset_buffer, { desc = "reset buffer" })
map("n", "<space>gp", require("gitsigns").preview_hunk, { desc = "preview hunk" })
map("n", "<space>gb", function() require("gitsigns").blame_line { full = true } end, { desc = "blame line" })
map("n", "<space>gtb", require("gitsigns").toggle_current_line_blame, { desc = "toggle blame line" })
map("n", "<space>gd", require("gitsigns").diffthis, { desc = "diff hunk" })
map("n", "<space>gD", function() require("gitsigns").diffthis("~") end, { desc = "diff file" })
map("n", "<space>gtd", require("gitsigns").toggle_deleted, { desc = "toggle deleted" })
map("n", "]g", "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'", { desc = "next git change", expr = true })
map("n", "[g", "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'", { desc = "prev git change", expr = true })

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
