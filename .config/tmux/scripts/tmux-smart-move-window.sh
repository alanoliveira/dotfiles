#!/usr/bin/env bash

last_window=$(tmux lsw -F "#{window_index}" | tail -n1)
dst=$(( $1 > $last_window ? $last_window : $1 ))
tmux move-window -t 0
tmux move-window -r
for((i=2; i<=$dst; i++))
do
  tmux move-window -t 0 -s $dst -d
  tmux move-window -r
done
