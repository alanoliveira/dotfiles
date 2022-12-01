vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.guifont = "JetBrainsMono Nerd Font Mono"

local map = vim.keymap.set
map("n", "<esc>", ":x<CR>", {})


local augroup = vim.api.nvim_create_augroup("firenvim", {})
-- " Keep input sync with buffer (without this setting the cursor position not behaves as expected)
vim.api.nvim_create_autocmd("TextChanged", { group = augroup, pattern = "*", nested = true, command = "write" })
vim.api.nvim_create_autocmd("TextChangedI", { group = augroup, pattern = "*", nested = true, command = "write" })

vim.api.nvim_create_autocmd("BufEnter", { group = augroup, command = "startinsert" })
vim.api.nvim_create_autocmd("BufEnter", { group = augroup, pattern = "*INPUT*", callback = function()
  map("n", "<CR>", ":x<CR>")
  map("i", "<CR>", "<esc>:x<CR>")
end, })

local local_settings = {}
local_settings[".*"] = { takeover = "never" }
-- local_settings["https?://github\\.com"] = { takeover = "always" }
vim.g.firenvim_config = { globalSettings = { alt = "all" }, localSettings = local_settings }
