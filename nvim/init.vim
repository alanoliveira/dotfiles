language en_US.UTF-8

if exists('g:started_by_firenvim')
  runtime firenvim.vim
  finish
endif

set cmdheight=0
set clipboard=unnamedplus
set noshowmode
set hidden
set visualbell
set nobackup
set noswapfile
set number
set relativenumber
set signcolumn=yes
set scrolloff=2
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set updatetime=300
set foldmethod=syntax nofoldenable
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set completeopt=menuone,noselect
set nowrap
set list
set path+=**
set laststatus=3
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m
set spell spelllang=en_us spelloptions+=camel
set inccommand=split
let g:loaded_matchit = 1 " disable matchit
let g:mapleader=','
let g:camelcasemotion_key='<leader>'
let g:direnv_auto=0

lua require "alan.globals"

call plug#begin()
    Plug 'nvim-lua/plenary.nvim' " lua commom functions
    Plug 'numToStr/Comment.nvim' " shortcut to comment/uncomment
    Plug 'windwp/nvim-autopairs' " auto close brackets, etc
    Plug 'bkad/CamelCaseMotion' " allow use vim motion with CamelCaseStrings
    " Plug 'justinmk/vim-sneak' " allow move using two chars
    Plug 'kylechui/nvim-surround' " shortcut for surround with {,[,', etc
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " use nvim inside chrome inputs
    Plug 'lukas-reineke/indent-blankline.nvim' " display special characters and highlight block
    Plug 'mrjones2014/smart-splits.nvim' " improved panel resizing
    Plug 'andymass/vim-matchup' " matchit better alternative
    Plug 'direnv/direnv.vim' " direnv integration
    Plug 'akinsho/toggleterm.nvim' " terminal window manipulation

    " snippets
    Plug 'L3MON4D3/LuaSnip', { 'tag': 'v<CurrentMajor>.*' } " snippets plugin
    Plug 'rafamadriz/friendly-snippets' " collection of snippets

    " test
    Plug 'nvim-neotest/neotest' " interect with tests
    Plug 'nvim-neotest/neotest-go' " go adapter
    Plug 'olimorris/neotest-rspec' " rspec adapter

    " language specifc stuffs
    Plug 'folke/lua-dev.nvim' " for plugin dev
    Plug 'milisims/nvim-luaref' " add api documentation to h:
    Plug 'slim-template/vim-slim' " slim
    Plug 'ziglang/zig.vim', { 'for': 'zig' } " zig

    " git
    Plug 'tpope/vim-fugitive' " git interaction
    Plug 'lewis6991/gitsigns.nvim' " show git status in sign column, and add shortcuts to reset, hunk

    " debugger
    Plug 'mfussenegger/nvim-dap' " better debugger
    Plug 'rcarriga/nvim-dap-ui' " debugger ui
    Plug 'nvim-telescope/telescope-dap.nvim' " telescope integration
    Plug 'theHamsta/nvim-dap-virtual-text' " show current variable variable values
    Plug 'leoluz/nvim-dap-go' " go config for dap

    " database
    Plug 'tpope/vim-dadbod' " run queries in command line
    Plug 'kristijanhusak/vim-dadbod-ui' " ui for dadbod
    Plug 'kristijanhusak/vim-dadbod-completion' " autocomplete for sql
    Plug 'pbogut/vim-dadbod-ssh' " allows vim-dadbod connections through ssh

    " themes
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/sonokai'
    Plug 'rebelot/kanagawa.nvim'

    " widgets
    Plug 'nvim-telescope/telescope.nvim' " file explorer
    Plug 'nvim-lualine/lualine.nvim' " status line
    Plug 'akinsho/bufferline.nvim' " buffer as tabs
    Plug 'kyazdani42/nvim-tree.lua' " side bar
    Plug 'kyazdani42/nvim-web-devicons' " icons mapping
    Plug 'chentoast/marks.nvim' " add marks in sign column
    Plug 'goolord/alpha-nvim' " startup screen
    Plug 'folke/which-key.nvim' " display a popup with key bindings

    " treesitter
    Plug 'nvim-treesitter/nvim-treesitter', { 'run': ':TSUpdate' } " treesitter
    Plug 'p00f/nvim-ts-rainbow' " colored brackets
    Plug 'nvim-treesitter/playground' " explore treesitter

    "LSP
    Plug 'neovim/nvim-lspconfig' " lsp quick configs
    Plug 'williamboman/nvim-lsp-installer' " lsp servers quick install
    Plug 'lukas-reineke/lsp-format.nvim' " allow toggle lsp formatting
    Plug 'jose-elias-alvarez/null-ls.nvim' " generic language server

    "Code completion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'onsails/lspkind.nvim' " icons
call plug#end()

runtime appearance.vim
lua require "alan"
