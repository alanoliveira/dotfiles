local neotest = require("neotest");
neotest.setup({
  adapters = {
    require("neotest-go"),
    require('neotest-rspec'),
  },
})

vim.keymap.set("n", "<space>tn", function() neotest.run.run() end, { desc = "[test] run nearest" })
vim.keymap.set("n", "<space>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "[test] run file" })
vim.keymap.set("n", "<space>tl", function() neotest.run.run_last() end, { desc = "[test] run last" })
vim.keymap.set("n", "<space>to", function() neotest.output.open() end, { desc = "[test] show output" })
vim.keymap.set("n", "<space>ts", function() neotest.summary.open() end, { desc = "[test] show summary" })
