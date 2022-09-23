call plug#begin()
  Plug 'glacambre/firenvim'
call plug#end()

let $std_after = stdpath('config').'/after'
set runtimepath-=$std_after
set clipboard=unnamedplus
set laststatus=0
set noshowmode

nnoremap <esc> :x<cr>

" Keep input sync with buffer (without this setting the cursor position not behaves as expected)
au TextChanged * ++nested write
au TextChangedI * ++nested write
" au BufEnter * startinsert
au BufEnter *INPUT*.txt noremap <cr> <esc>:x<cr> |
                      \ inoremap <cr> <esc>:x<cr>


let local_settings = {}
let local_settings['.*'] = { 'takeover': 'never' }
let local_settings['https?://github\.com'] = { 'takeover': 'always' }
let g:firenvim_config = { 'globalSettings': { 'alt': 'all' }, 'localSettings': local_settings }
