#!/usr/bin/env bash

nvim --noplugin --clean $1 \
  --cmd 'set number laststatus=0 cmdheight=0' \
  --cmd 'nnoremap q :q! <CR>' \
  --cmd 'nnoremap <esc> :q! <CR>' \
  --cmd 'nnoremap <silent> a :$read !tmux display-message -p "\#{pane_current_path}" <CR>' \
  --cmd 'nnoremap <silent> <CR> :silent .w !$XDG_CONFIG_HOME/tmux/scripts/tmux-sessionizer.sh<CR> <BAR> :x!<CR>' \
  --cmd 'nnoremap <silent> 1 :silent 1w !$XDG_CONFIG_HOME/tmux/scripts/tmux-sessionizer.sh<CR> <BAR> :x!<CR>' \
  --cmd 'nnoremap <silent> 2 :silent 2w !$XDG_CONFIG_HOME/tmux/scripts/tmux-sessionizer.sh<CR> <BAR> :x!<CR>' \
  --cmd 'nnoremap <silent> 3 :silent 3w !$XDG_CONFIG_HOME/tmux/scripts/tmux-sessionizer.sh<CR> <BAR> :x!<CR>' \
  --cmd 'nnoremap <silent> 4 :silent 4w !$XDG_CONFIG_HOME/tmux/scripts/tmux-sessionizer.sh<CR> <BAR> :x!<CR>' \
  --cmd 'nnoremap <silent> 5 :silent 5w !$XDG_CONFIG_HOME/tmux/scripts/tmux-sessionizer.sh<CR> <BAR> :x!<CR>'
