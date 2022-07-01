augroup _general_settings
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd FocusGained,BufEnter * :silent! ! " used with `set autoread` to reload the file when focus
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable auto coment insertion
augroup end

command! TrimTrailingWhiteSpaces %s/\s\+$//e
command! ReloadConf source $MYVIMRC
command! ClearSearch let @/ = ""
command! ToggleVirtualText luaeval("require 'toggle_lsp_diagnostics'.toggle_virtual_text")
