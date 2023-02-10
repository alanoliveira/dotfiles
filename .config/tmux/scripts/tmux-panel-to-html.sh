#!/usr/bin/env sh

tmux capture-pane -e -b "buffer-html"
tmux set-buffer -w -b "buffer-html" "$(tmux show-buffer | aha)"
tmux delete-buffer
