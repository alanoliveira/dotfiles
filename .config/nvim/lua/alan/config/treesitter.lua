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
