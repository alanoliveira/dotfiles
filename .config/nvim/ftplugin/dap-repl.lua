local map = vim.keymap.set
map("i", "<C-h>", "<Esc><C-w>h", { buffer = 0 });
map("i", "<C-k>", "<Esc><C-w>k", { buffer = 0 });
map("i", "<C-j>", "<Esc><C-w>j", { buffer = 0 });
map("i", "<C-l>", "<Esc><C-w>l", { buffer = 0 });

local function kick_cursor()
  local pos = vim.api.nvim_win_get_cursor(0)
  pos[2] = vim.fn.col("$")
  vim.api.nvim_win_set_cursor(0, pos)
end

map("i", "<C-p>", function() require("dap.repl").on_up(); kick_cursor() end, { buffer = 0, silent = true })
map("i", "<C-n>", function() require("dap.repl").on_down(); kick_cursor() end, { buffer = 0, silent = true })
map("i", "<C-j>", "<cr>", { buffer = 0, silent = true })

local group = vim.api.nvim_create_augroup("dap-repl", {})
vim.api.nvim_create_autocmd("BufEnter", { group = group, command = "startinsert", buffer = 0 })

vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.cursorcolumn = false

require("dap.ext.autocompl").attach()
