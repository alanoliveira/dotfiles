local augroup = vim.api.nvim_create_augroup("set_terminal_ft", {})
vim.api.nvim_create_autocmd("TermOpen", { group = augroup, command = "set filetype=terminal", pattern = "term://*" })
