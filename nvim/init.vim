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
set formatoptions-=cro

call plug#begin()
    Plug 'tpope/vim-sensible' " set some default options
    Plug 'tpope/vim-commentary' " shortcut to comment/uncomment
    Plug 'tpope/vim-surround' " shortcut for surround with {,[,', etc
    Plug 'tpope/vim-repeat' " allow use '.' to repeat some plugins actions
    Plug 'windwp/nvim-autopairs' " auto close brackets, etc
    Plug 'bkad/CamelCaseMotion' " allow use vim motion with CamelCaseStrings
    Plug 'easymotion/vim-easymotion' " improved motion
    Plug 'justinmk/vim-sneak' " allow move using two chars
    Plug 'bronson/vim-visual-star-search' " improve usage of '*' on visual mode
    Plug 'vim-scripts/ReplaceWithRegister' " shortcut to replace with register content
    Plug 'moll/vim-bbye' " allow exit buffer without kill the window
    Plug 'tpope/vim-dispatch' " allow run async commands
    Plug 'tpope/vim-fugitive' " git interaction
    Plug 'lewis6991/gitsigns.nvim' " show git status in sign column, and add shortcuts to reset, hunk
    Plug 'tpope/vim-rails' " add rails command to command line mode
    Plug 'tpope/vim-bundler' " add bundle command to command line mode

    Plug 'thoughtbot/vim-rspec' " add rspec command to command line mode, and allow some smart spec runs
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go
    Plug 'ziglang/zig.vim' " zig
    Plug 'slim-template/vim-slim' " slim

    " database
    Plug 'tpope/vim-dadbod' " run queries in command line
    Plug 'kristijanhusak/vim-dadbod-ui' " ui for dadbod
    Plug 'kristijanhusak/vim-dadbod-completion' " autocomplete for sql 

    " appearance/ui
    Plug 'morhetz/gruvbox' " theme
    Plug 'nvim-lualine/lualine.nvim' " status line
    Plug 'akinsho/bufferline.nvim' " buffer as tabs
    Plug 'kyazdani42/nvim-tree.lua' " side bar
    Plug 'kyazdani42/nvim-web-devicons' " icons mapping
    Plug 'lukas-reineke/indent-blankline.nvim' " display special characters and highlight block             
    Plug 'chentoast/marks.nvim' " add marks in sign column

    Plug 'nvim-treesitter/nvim-treesitter', { 'run': ':TSUpdate' } " treesitter
    Plug 'p00f/nvim-ts-rainbow' " colored brackets
    Plug 'JoosepAlviste/nvim-ts-context-commentstring' " use treesitter to choose the type of comment
    Plug 'nvim-lua/plenary.nvim' " lua commom functions
    Plug 'nvim-telescope/telescope.nvim' " file explorer

    "LSP
    Plug 'neovim/nvim-lspconfig' " lsp quick configs
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim' " toggle lsp diagnostics
    Plug 'williamboman/nvim-lsp-installer' " lsp servers quick install
    Plug 'lukas-reineke/lsp-format.nvim' " allow toggle lsp formatting
    Plug 'jose-elias-alvarez/null-ls.nvim' " generic language server

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
