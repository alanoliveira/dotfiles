return require("packer").startup(function(use)
  use "wbthomason/packer.nvim" -- packer itself
  use "nvim-lua/plenary.nvim" -- lua commom functions
  use "numToStr/Comment.nvim" -- shortcut to comment/uncomment
  use "windwp/nvim-autopairs" -- auto close brackets, etc
  use "kylechui/nvim-surround" -- shortcut for surround with {,[,', etc
  use { "glacambre/firenvim", run = function() vim.fn["firenvim#install"](0) end } -- use nvim inside chrome inputs
  use "lukas-reineke/indent-blankline.nvim" -- display special characters and highlight block
  use "mrjones2014/smart-splits.nvim" -- improved panel resizing
  use "andymass/vim-matchup" -- matchit better alternative
  use "direnv/direnv.vim" -- direnv integration
  use "akinsho/toggleterm.nvim" -- terminal window manipulation

  -- snippets
  use { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" } -- snippets plugin
  use "rafamadriz/friendly-snippets" -- collection of snippets

  -- test
  use "nvim-neotest/neotest" -- interect with tests
  use "nvim-neotest/neotest-go" -- go adapter
  use "olimorris/neotest-rspec" -- rspec adapter

  -- language specifc stuffs
  use "slim-template/vim-slim" -- slim
  use({ "ziglang/zig.vim", ft = "zig" }) -- zig

  -- git
  use "tpope/vim-fugitive" -- git interaction
  use "lewis6991/gitsigns.nvim" -- show git status in sign column, and add shortcuts to reset, hunk

  -- debugger
  use "mfussenegger/nvim-dap" -- better debugger
  use "rcarriga/nvim-dap-ui" -- debugger ui
  use "nvim-telescope/telescope-dap.nvim" -- telescope integration
  use "theHamsta/nvim-dap-virtual-text" -- show current variable variable values
  use "leoluz/nvim-dap-go" -- go config for dap

  -- database
  use "tpope/vim-dadbod" -- run queries in command line
  use "kristijanhusak/vim-dadbod-ui" -- ui for dadbod
  use "kristijanhusak/vim-dadbod-completion" -- autocomplete for sql
  use "pbogut/vim-dadbod-ssh" -- allows vim-dadbod connections through ssh

  -- themes
  use "sainnhe/gruvbox-material"
  use "sainnhe/sonokai"
  use "rebelot/kanagawa.nvim"

  -- widgets
  use "nvim-telescope/telescope.nvim" -- file explorer
  use "nvim-lualine/lualine.nvim" -- status line
  use "akinsho/bufferline.nvim" -- buffer as tabs
  use "kyazdani42/nvim-tree.lua" -- side bar
  use "kyazdani42/nvim-web-devicons" -- icons mapping
  use "chentoast/marks.nvim" -- add marks in sign column
  use "goolord/alpha-nvim" -- startup screen
  use "folke/which-key.nvim" -- display a popup with key bindings

  -- treesitter

  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- treesitter
  use "p00f/nvim-ts-rainbow" -- colored brackets
  use "nvim-treesitter/playground" -- explore treesitter

  --LSP
  use "neovim/nvim-lspconfig" -- lsp quick configs
  use "williamboman/nvim-lsp-installer" -- lsp servers quick install
  use "lukas-reineke/lsp-format.nvim" -- allow toggle lsp formatting
  use "jose-elias-alvarez/null-ls.nvim" -- generic language server
  use "Maan2003/lsp_lines.nvim" -- diagnostics as virtual lines

  -- Code completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "ray-x/lsp_signature.nvim"
  use "onsails/lspkind.nvim" -- icons

  local local_plugins = vim.fn.globpath("$HOME/Sources/nvim-plugins/", "*", false, true)
  for _, local_plugin in pairs(local_plugins) do
    use(local_plugin)
  end
end)
