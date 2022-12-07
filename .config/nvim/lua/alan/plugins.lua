return require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" } -- packer itself
  use { "nvim-lua/plenary.nvim" } -- lua common functions
  use { "williamboman/mason.nvim" } -- manage lsp, dap, linters and formatters
  use { "williamboman/mason-lspconfig.nvim" } -- lsp servers quick install
  use { "nvim-telescope/telescope.nvim", config = [[require("alan.config.telescope")]],
    requires = "nvim-telescope/telescope-live-grep-args.nvim", } -- file explorer
  use { "nvim-lualine/lualine.nvim", config = [[require("alan.config.lualine")]] } -- status line
  use { "akinsho/bufferline.nvim", config = [[require("alan.config.bufferline")]] } -- buffer as tabs
  use { "vimwiki/vimwiki", setup = [[require("alan.config.vimwiki")]] } -- vim wiki
  use { "mbbill/undotree" }
  use { "tpope/vim-fugitive" }

  use { "numToStr/Comment.nvim", config = [[require("alan.config.comment")]] } -- shortcut to comment/uncomment
  use { "windwp/nvim-autopairs", config = [[require("alan.config.autopairs")]] } -- auto close brackets, etc
  use { "kylechui/nvim-surround", config = [[require("alan.config.nvim-surround")]], module = "nvim-treesitter" } -- shortcut for surround with {,[,', etc
  use { "lukas-reineke/indent-blankline.nvim", config = [[require("alan.config.indent-blankline")]] } -- add indentation guide lines
  use { "mrjones2014/smart-splits.nvim", config = [[require("alan.config.smart-splits")]] } -- improved panel resizing
  use { "andymass/vim-matchup" } -- matchit better alternative
  use { "direnv/direnv.vim", setup = [[require("alan.config.direnv")]] } -- direnv integration
  use { "akinsho/toggleterm.nvim", config = [[require("alan.config.toggleterm")]] } -- terminal window manipulation
  use { "lewis6991/gitsigns.nvim", config = [[require("alan.config.gitsigns")]] } -- show git status in sign column, and add shortcuts to reset, hunk
  use { "ThePrimeagen/harpoon", config = [[require("alan.config.harpoon")]] }

  -- snippets
  use { "L3MON4D3/LuaSnip",
    config = [[require("alan.config.luasnip")]],
    requires = {
      "rafamadriz/friendly-snippets",
    },
  }

  -- test
  use { "nvim-neotest/neotest",
    config = [[require("alan.config.neotest")]],
    keys = "<leader>t",
    requires = {
      "nvim-neotest/neotest-go",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-plenary",
      "rouge8/neotest-rust",
    },
  }

  -- language specifc stuffs
  use { "slim-template/vim-slim", ft = "slim" } -- slim
  use { "ziglang/zig.vim", ft = "zig" } -- zig


  -- debugger
  use { "mfussenegger/nvim-dap",
    config = [[require("alan.config.dap")]],
    keys = "<leader>d",
    requires = {
      "rcarriga/nvim-dap-ui", -- debugger ui
      "nvim-telescope/telescope-dap.nvim", -- telescope integration
      "theHamsta/nvim-dap-virtual-text", -- show current variable values
    },
  }

  -- database
  use { "tpope/vim-dadbod",
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
  }

  -- color schemes
  use { "sainnhe/gruvbox-material" }
  use { "sainnhe/sonokai" }
  use { "rebelot/kanagawa.nvim" }
  use { "gruvbox-community/gruvbox" }
  use { "folke/tokyonight.nvim" }

  use { "kyazdani42/nvim-tree.lua", keys = "<C-b>", config = [[require("alan.config.nvim-tree")]] } -- side bar
  use { "kyazdani42/nvim-web-devicons" } -- icons mapping
  use { "chentoast/marks.nvim", config = [[require("alan.config.marks")]] } -- add marks in sign column
  use { "goolord/alpha-nvim", config = [[require("alan.config.alpha")]] } -- startup screen
  use { "folke/which-key.nvim", config = [[require("alan.config.which-key")]] } -- display a popup with key bindings
  use { "rcarriga/nvim-notify" } -- kawaii notifications

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = [[require("alan.config.treesitter")]],
    run = ":TSUpdate",
    requires = {
      "nvim-treesitter/playground", -- explore treesitter
      "nvim-treesitter/nvim-treesitter-context", -- show block context
    },
  }

  --LSP
  use {
    "neovim/nvim-lspconfig", -- lsp quick configs
    config = [[require("alan.config.lsp")]],
    requires = {
      "lukas-reineke/lsp-format.nvim", -- allow toggle lsp formatting
      "jose-elias-alvarez/null-ls.nvim", -- generic language server
      "Maan2003/lsp_lines.nvim", -- diagnostics as virtual lines
      "onsails/lspkind.nvim", -- icons for lsp
    },
  }

  -- Code completion
  use {
    "hrsh7th/nvim-cmp",
    config = [[require("alan.config.cmp")]],
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "ray-x/lsp_signature.nvim",
    },
  }

  local local_plugins = vim.fn.globpath("$HOME/Sources/nvim-plugins/", "*", false, true)
  for _, local_plugin in pairs(local_plugins) do
    use(local_plugin)
  end
end)
