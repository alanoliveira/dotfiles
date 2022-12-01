vim.g.direnv_auto = 0

local group = vim.api.nvim_create_augroup("direnv", {});
vim.api.nvim_create_autocmd("VimEnter", { group = group, command = "DirenvExport" })
vim.api.nvim_create_autocmd("DirChanged", { group = group, command = "DirenvExport" })
