return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", optional = true },
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>ct", function() require("trouble").open("diagnostics") end)
  end
}
