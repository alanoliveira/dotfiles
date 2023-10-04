return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd("colorscheme catppuccin-latte")
  end,
}
