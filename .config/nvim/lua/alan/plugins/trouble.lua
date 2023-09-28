return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>ct", function() require("trouble").open("document_diagnostics") end)
  end
}
