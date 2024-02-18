vim.keymap.set("n", "gd", "<cmd>exec 'Telescope custom taglist search=' . expand('<cword>')<cr>", { buffer = true })
