vim.opt_local.number = false
vim.opt_local.relativenumber = false

local map = vim.keymap.set
map("t", "<space><esc>", "<C-\\><C-n>", { buffer = true, desc = "exit terminal mode" })
map("t", "<esc><esc>", "<C-\\><C-n>", { buffer = true, desc = "exit terminal mode" })

local augroup = vim.api.nvim_create_augroup("terminal_au", {})
vim.api.nvim_create_autocmd({ "BufEnter" }, { group = augroup, command = "startinsert", pattern = { "term://*" } })
