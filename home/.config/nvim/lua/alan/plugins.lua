return require("packer").startup(function(use)
  use { "glacambre/firenvim", -- use nvim inside chrome inputs
    run = function() vim.fn["firenvim#install"](0) end,
    cond = function() return vim.g.started_by_firenvim end,
  }

  use { "wbthomason/packer.nvim" } -- packer itself
  use { "nvim-lua/plenary.nvim" } -- lua commom functions
  use { "numToStr/Comment.nvim", config = [[require("alan.config.comment")]] } -- shortcut to comment/uncomment
  use { "windwp/nvim-autopairs", config = [[require("alan.config.autopairs")]] } -- auto close brackets, etc
  use { "kylechui/nvim-surround", config = [[require("alan.config.nvim-surround")]] } -- shortcut for surround with {,[,', etc
  use { "lukas-reineke/indent-blankline.nvim", config = [[require("alan.config.indent-blankline")]] } -- display special characters and highlight block
  use { "mrjones2014/smart-splits.nvim", config = [[require("alan.config.smart-splits")]] } -- improved panel resizing
  use { "andymass/vim-matchup" } -- matchit better alternative
  use { "direnv/direnv.vim", setup = [[require("alan.config.direnv")]] } -- direnv integration
  use { "akinsho/toggleterm.nvim", config = [[require("alan.config.toggleterm")]] } -- terminal window manipulation

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

  -- git
  use { "tpope/vim-fugitive" } -- git interaction
  use { "lewis6991/gitsigns.nvim", config = [[require("alan.config.gitsigns")]] } -- show git status in sign column, and add shortcuts to reset, hunk

  -- debugger
  use { "mfussenegger/nvim-dap",
    config = [[require("alan.config.dap")]],
    keys = "<leader>d",
    requires = {
      "rcarriga/nvim-dap-ui", -- debugger ui
      "nvim-telescope/telescope-dap.nvim", -- telescope integration
      "theHamsta/nvim-dap-virtual-text", -- show current variable variable values
      "leoluz/nvim-dap-go", -- go config for dap

    },
  }

  -- database
  use { "tpope/vim-dadbod", -- run queries in command line
    requires = {
      "kristijanhusak/vim-dadbod-ui", -- ui for dadbod
      "kristijanhusak/vim-dadbod-completion", -- autocomplete
    },
  }

  -- themes
  use { "sainnhe/gruvbox-material" }
  use { "sainnhe/sonokai" }
  use { "rebelot/kanagawa.nvim" }

  -- widgets
  use { "nvim-telescope/telescope.nvim", config = [[require("alan.config.telescope")]] } -- file explorer
  use { "nvim-lualine/lualine.nvim", config = [[require("alan.config.lualine")]] } -- status line
  use { "akinsho/bufferline.nvim", config = [[require("alan.config.bufferline")]] } -- buffer as tabs
  use { "kyazdani42/nvim-tree.lua", keys = "<C-b>", config = [[require("alan.config.nvim-tree")]] } -- side bar
  use { "kyazdani42/nvim-web-devicons" } -- icons mapping
  use { "chentoast/marks.nvim", config = [[require("alan.config.marks")]] } -- add marks in sign column
  use { "goolord/alpha-nvim", config = [[require("alan.config.alpha")]] } -- startup screen
  use { "folke/which-key.nvim", config = [[require("alan.config.which-key")]] } -- display a popup with key bindings
  use { "rcarriga/nvim-notify" } -- notification manager
  use { "williamboman/mason.nvim" } -- manage lsp, dap, linters and formatters
  use { "williamboman/mason-lspconfig.nvim" } -- lsp servers quick install
  use { "vimwiki/vimwiki", setup = [[require("alan.config.vimwiki")]] } -- vim wiki

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = [[require("alan.config.treesitter")]],
    run = ":TSUpdate",
    requires = {
      "nvim-treesitter/playground", -- explore treesitter
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
      "onsails/lspkind.nvim", -- icons
    },
  }

  local local_plugins = vim.fn.globpath("$HOME/Sources/nvim-plugins/", "*", false, true)
  for _, local_plugin in pairs(local_plugins) do
    use(local_plugin)
  end
end)
