#!/usr/bin/env bash
CLIENT_WIDTH=$(tmux display-message -p '#{client_width}')
SA='#[fg=colour255,bg=colour238,none]'
SB='#[fg=colour255,bg=colour241,none]'
SC='#[fg=colour255,bg=colour27,bold]'
SD='#[fg=colour255,bg=colour239,none]'


LEFT=$(tmux display-message -p " #S ")
LEFT_SIZE=$(tmux display-message -p "#{w:#{l:$LEFT}}")

RIGHT=" %Y-%m-%d %H:%M "
RIGHT_SIZE=$(tmux display-message -p "#{w:#{l:$RIGHT}}")

MIDDLE=""
IFS=$'\n'
for window in $(tmux list-windows -F "#{?window_active,#{l:$SC},}#{?window_last_flag,#{l:$SD},} #{window_index}:#{window_name} ")
do
  MIDDLE="$MIDDLE$window$SA"
done
MIDDLE_SIZE=$(tmux display-message -p "#{w:#{l:$MIDDLE}}")

RIGHT_PADDING=$(($CLIENT_WIDTH - $LEFT_SIZE - $MIDDLE_SIZE - $RIGHT_SIZE))
tmux display-message -d 0 "$SB$LEFT$SA$MIDDLE#{p-$RIGHT_PADDING:}$SB$RIGHT"
