#!/usr/bin/env bash

PROJECTS_FILE=$HOME/.projects
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --history='$HOME/.cache/tmux_sessionizer'"

if [[ $# -eq 1 ]]; then
    selected=$1
elif [[ -f $PROJECTS_FILE ]]; then
    selected=$(cat $PROJECTS_FILE | FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS fzf)
else
    selected=$(fd -g "*" "$HOME/Sources/" --exact-depth=1 --type d | FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
