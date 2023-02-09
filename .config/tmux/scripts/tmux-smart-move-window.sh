#!/usr/bin/env bash

if [ $1 =~ '^[0-9]+$' ]; then
  exit 0
fi

last_window=$(tmux lsw -F "#{window_index}" | tail -n1)
dst=$(( $1 > $last_window ? $last_window : $1 ))
tmux move-window -t 0
tmux move-window -r
for((i=2; i<=$dst; i++))
do
  tmux move-window -t 0 -s $dst -d
  tmux move-window -r
done
tmux display-message "window was moved to #{window_index}"
