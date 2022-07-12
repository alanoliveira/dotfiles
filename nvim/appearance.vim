syntax enable
colorscheme gruvbox

set termguicolors
set colorcolumn=120
set cursorline
set background=dark

set list
set listchars=tab:»-,trail:-,eol:↴,extends:»,precedes:«,nbsp:%,space:⋅

match ExtraWhitespace /\s\+\%#\@<!$/
highlight QuickFixLine ctermfg=NONE guifg=NONE
highlight ExtraWhitespace ctermbg=red guibg=red
