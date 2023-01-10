return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/playground", -- explore treesitter
    "nvim-treesitter/nvim-treesitter-context", -- show block context
  },
  config = function()
    require "nvim-treesitter.configs".setup {
      auto_install = true,
      highlight = {
        enable = true,
      },
      playground = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
    }
    require("treesitter-context").setup()
  end,
}
