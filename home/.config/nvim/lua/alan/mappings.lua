local map = vim.keymap.set

map({ "t", "n" }, "<C-h>", "<cmd> lua require('smart-splits').move_cursor_left()<CR>", { desc = "move to left split" })
map({ "t", "n" }, "<C-j>", "<cmd> lua require('smart-splits').move_cursor_down()<CR>", { desc = "move to down split" })
map({ "t", "n" }, "<C-k>", "<cmd> lua require('smart-splits').move_cursor_up()<CR>", { desc = "mode to up split" })
map({ "t", "n" }, "<C-l>", "<cmd> lua require('smart-splits').move_cursor_right()<CR>", { desc = "move to right split" })
map("n", "<leader>/", "<cmd> ToggleHLS<CR>", { desc = "toggle hls" })
map("s", "<C-w>", "<BS>i", { desc = "delete word" }) -- used to delete suggestions on luasnip

map("n", "<M-j>", "<esc>:m .+1<CR>", { desc = "move line down" })
map("n", "<M-k>", "<esc>:m .-2<CR>", { desc = "move line up" })
map("v", "<M-j>", ":m '>+1<CR>gv", { desc = "move selection down" })
map("v", "<M-k>", ":m '<-2<CR>gv", { desc = "move selection up" })
