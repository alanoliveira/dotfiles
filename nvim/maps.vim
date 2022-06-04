let g:camelcasemotion_key = ','
let g:mapleader = "\<space>"

" mouse
:vnoremap <RightMouse> y

" window navigation
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l

nnoremap <silent><expr> <Leader>/ (&hls && v:hlsearch ? ':nohls' : ':set hls').'<CR>'

" nnoremap <silent> J 5j
" nnoremap <silent> K 5k
" nnoremap <silent> <leader>J :j<CR>

nnoremap <silent> <A-l> :BufferLineCycleNext<CR>
nnoremap <silent> <A-h> :BufferLineCyclePrev<CR>
nnoremap <silent> <A-L> :BufferLineMoveNext<CR>
nnoremap <silent> <A-H> :BufferLineMovePrev<CR>
nnoremap <leader>q :Bdelete<CR>

" q quit help files
autocmd FileType qf,help,man,lspinfo,*doc nnoremap <silent> <buffer> q :close<CR> 
autocmd FileType qf,help,man,lspinfo,*doc nnoremap <silent> <buffer> <leader>q :close<CR> 
