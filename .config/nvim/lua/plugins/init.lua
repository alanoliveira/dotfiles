return {
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "mbbill/undotree" },
  { "tpope/vim-fugitive" },
  { "numToStr/Comment.nvim", config = true },
  { "kylechui/nvim-surround", config = true, module = "nvim-treesitter" },
  { "andymass/vim-matchup" },
  { "folke/which-key.nvim", config = true },
  { "chentoast/marks.nvim", config = true },
  { "rcarriga/nvim-notify", config = function() vim.notify = require("notify") end },

  -- language specifc stuffs
  { "slim-template/vim-slim", ft = "slim" },
  { "ziglang/zig.vim", ft = "zig" },

  -- colorschemes
  { "sainnhe/gruvbox-material", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "gruvbox-community/gruvbox", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
}
