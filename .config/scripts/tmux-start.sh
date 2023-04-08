#!/usr/bin/env bash

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [[ -z $TMUX ]]; then
  free_sess=$(tmux list-sessions -f '#{&&:#{?session_attached,0,1},#{m:main-*,#{session_name}}}' -F '#{session_id}' 2> /dev/null | head -1)
  if [[ -z $free_sess ]]; then
    tmux new-session \; rename-session "main-#S"
  else
    tmux attach-session -t $free_sess
  fi
fi
