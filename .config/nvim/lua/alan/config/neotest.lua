local neotest = require("neotest");
neotest.setup({
  adapters = {
    require("neotest-go"),
    require("neotest-rspec"),
    require("neotest-plenary"),
    require("neotest-rust"),
  },
})

vim.keymap.set("n", "<leader>tn", function() neotest.run.run() end, { desc = "[test] run nearest" })
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "[test] run file" })
vim.keymap.set("n", "<leader>tl", function() neotest.run.run_last() end, { desc = "[test] run last" })
vim.keymap.set("n", "<leader>tm", function() neotest.run.run_marked() end, { desc = "[test] run marked" })
vim.keymap.set("n", "<leader>to", function() neotest.output.open() end, { desc = "[test] show output" })
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "[test] show summary" })
