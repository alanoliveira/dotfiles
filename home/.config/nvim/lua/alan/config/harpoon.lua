require("harpoon").setup()

local map = vim.keymap.set
map("n", "<leader>ja", require("harpoon.mark").add_file, { desc = "harpoon add file" })
map("n", "<leader>jd", require("harpoon.mark").rm_file, { desc = "harpoon add file" })
map("n", "<leader>jf", require("harpoon.ui").toggle_quick_menu, { desc = "harpoon toggle menu" })
map("n", "<leader>jn", require("harpoon.ui").nav_next, { desc = "harpoon next" })
map("n", "<leader>jp", require("harpoon.ui").nav_prev, { desc = "harpoon prev" })
map("n", "<leader>jt", function() require("harpoon.term").gotoTerminal(1) end, { desc = "harpoon toggle menu" })
map("n", "<leader>j1", function() require("harpoon.ui").nav_file(1) end, { desc = "harpoon goto 1" })
map("n", "<leader>j2", function() require("harpoon.ui").nav_file(2) end, { desc = "harpoon goto 2" })
map("n", "<leader>j3", function() require("harpoon.ui").nav_file(3) end, { desc = "harpoon goto 3" })
map("n", "<leader>j4", function() require("harpoon.ui").nav_file(4) end, { desc = "harpoon goto 4" })
