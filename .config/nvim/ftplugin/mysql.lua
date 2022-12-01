local map = vim.keymap.set
map("n", "<leader>pw", "<Plug>(DBUI_SaveQuery)", { buffer = 0, desc = "[dbui] save query" })
map("n", "<leader>pe", "<Plug>(DBUI_EditBindParameters)", { buffer = 0, desc = "[dbui] edit bind params" })
map("n", "<leader>ps", "<Plug>(DBUI_ExecuteQuery)", { buffer = 0, desc = "[dbui] run query" })
map("v", "<leader>ps", "<Plug>(DBUI_ExecuteQuery)", { buffer = 0, desc = "[dbui] run query" })
map("n", "<c-enter>", "<Plug>(DBUI_ExecuteQuery)", { buffer = 0, desc = "[dbui] run query" })
map("v", "<c-enter>", "<Plug>(DBUI_ExecuteQuery)", { buffer = 0, desc = "[dbui] run query" })
