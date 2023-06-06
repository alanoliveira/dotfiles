return {
  "tpope/vim-fugitive",
  init = function()
    vim.keymap.set("n", "<leader>gg", function() vim.cmd("Git") end, { desc = "fugitive" })
    vim.keymap.set("n", "<leader>gD", function() vim.cmd("Gvdiffsplit!") end, { desc = "fugitive" })

    vim.keymap.set("n", "<leader>g>", function()
      vim.cmd("diffget //2")
      vim.cmd("diffupdate")
    end, { desc = "get from left" })

    vim.keymap.set("n", "<leader>g<", function()
      vim.cmd("diffget //3")
      vim.cmd("diffupdate")
    end, { desc = "get from right" })
  end,
}
