vim.g.db_ui_disable_mappings = 1
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_force_echo_notifications = true

local group = vim.api.nvim_create_augroup("dadbod", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbui",
  group = group,
  callback = function()
    local opt = { buffer = true, nowait = true, silent = true, noremap = true }
    vim.keymap.set("n", "<enter>", "<Plug>(DBUI_SelectLine)", opt)
    vim.keymap.set("n", "o", "<Plug>(DBUI_SelectLine)", opt)
    vim.keymap.set("n", "q", "<Plug>(DBUI_Quit)", opt)
  end,
  desc = "Keymaps for dbui",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "pgsql" },
  group = group,
  callback = function()
    local opt = { buffer = true, nowait = true, noremap = true }
    vim.keymap.set({ "n", "v" }, "<space>r", "<Plug>(DBUI_ExecuteQuery)", opt)
  end,
  desc = "Keymaps for sql files",
})
