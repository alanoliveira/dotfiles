language en_US.UTF-8

"  some options are set by https://github.com/tpope/vim-sensible
set clipboard=unnamedplus
set noshowmode
set hidden
set visualbell
set nobackup
set noswapfile
set number
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
set mouse=a

call plug#begin()
    Plug 'tpope/vim-sensible' " set some default options
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'windwp/nvim-autopairs'
    Plug 'bkad/CamelCaseMotion'
    Plug 'easymotion/vim-easymotion'
    Plug 'justinmk/vim-sneak'
    Plug 'bronson/vim-visual-star-search'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'moll/vim-bbye'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fugitive'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'dag/vim-fish'
    Plug 'vim-ruby/vim-ruby'
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-bundler'
    Plug 'thoughtbot/vim-rspec'
    Plug 'fatih/vim-go'
    Plug 'ziglang/zig.vim'
    Plug 'slim-template/vim-slim'

    " appearance/ui
    Plug 'morhetz/gruvbox' " theme
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'lukas-reineke/indent-blankline.nvim'

    Plug 'nvim-treesitter/nvim-treesitter', { 'run': ':TSUpdate' }
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'sharkdp/fd'

    "LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    Plug 'williamboman/nvim-lsp-installer'

    "Code completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'ray-x/lsp_signature.nvim'
call plug#end()

runtime globals.lua
runtime maps.vim
runtime commands.vim
runtime appearance.vim
