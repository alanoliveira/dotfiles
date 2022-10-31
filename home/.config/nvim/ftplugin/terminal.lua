vim.opt_local.number = false
vim.opt_local.relativenumber = false

local map = vim.keymap.set
map("t", "<esc><esc>", "<C-\\><C-n>", { buffer = true, desc = "<esc>" })
