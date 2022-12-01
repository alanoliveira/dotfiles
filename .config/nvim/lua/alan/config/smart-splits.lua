require("smart-splits").setup({
  resize_mode = {
    resize_keys = { "H", "J", "K", "L" },
  },
})

local map = vim.keymap.set
map("n", "<C-w>H", "<cmd> lua require('smart-splits').resize_left(); require('smart-splits').start_resize_mode()<CR>",
  { desc = "resize ←" })
map("n", "<C-w>J", "<cmd> lua require('smart-splits').resize_down(); require('smart-splits').start_resize_mode()<CR>",
  { desc = "resize ↓" })
map("n", "<C-w>K", "<cmd> lua require('smart-splits').resize_up(); require('smart-splits').start_resize_mode()<CR>",
  { desc = "resize ↑" })
map("n", "<C-w>L", "<cmd> lua require('smart-splits').resize_right(); require('smart-splits').start_resize_mode()<CR>",
  { desc = "resize →" })
