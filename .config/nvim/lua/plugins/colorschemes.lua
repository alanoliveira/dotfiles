return {
  { "sainnhe/gruvbox-material", lazy = true },
  { "sainnhe/sonokai", lazy = true, },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "gruvbox-community/gruvbox", lazy = true },
  { "folke/tokyonight.nvim", lazy = false,  },
  { "projekt0n/github-nvim-theme", lazy = true },
  {"EdenEast/nightfox.nvim", lazy = false, priority = 1000, config = function() vim.cmd([[colorscheme nightfox]]) end }
}
