syntax enable
colorscheme gruvbox

set termguicolors
set colorcolumn=120
set cursorline
set background=dark

set list
set listchars=tab:»-,trail:-,eol:↴,extends:»,precedes:«,nbsp:%,space:⋅

highlight SpellBad guisp=red cterm=undercurl

highlight QuickFixLine ctermfg=NONE guifg=NONE
match ExtraWhitespace /\s\+\%#\@<!$/
highlight ExtraWhitespace ctermbg=red guibg=red

augroup _appearance_settings
    autocmd!
    autocmd FileType alpha highlight ExtraWhitespace NONE
augroup end
