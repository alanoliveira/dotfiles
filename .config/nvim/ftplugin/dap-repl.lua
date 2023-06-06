vim.opt_local.number = false
vim.opt_local.relativenumber = false

local map = vim.keymap.set

local function kick_cursor()
  local pos = vim.api.nvim_win_get_cursor(0)
  pos[2] = vim.fn.col("$")
  vim.api.nvim_win_set_cursor(0, pos)
end

map("i", "<C-P>", function() require("dap.repl").on_up(); kick_cursor() end, { buffer = 0, silent = true })
map("i", "<C-N>", function() require("dap.repl").on_down(); kick_cursor() end, { buffer = 0, silent = true })
map("i", "<C-J>", "<Cr>", { buffer = 0, silent = true })
map("i", "<C-W>", "<C-S-W>", { buffer = 0, silent = true })
map("i", "<C-C>", "<cmd>norm ddI<CR>", { buffer = 0, silent = true })

-- require("dap.ext.autocompl").attach()
