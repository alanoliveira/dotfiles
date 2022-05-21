#!/usr/bin/env bash

tmux_fpp_copy() {
  tmux_fpp "${BASH_SOURCE[0]} _tmux_fpp_copy_to_buffer"
}

tmux_fpp_run() {
  tmux_fpp "${BASH_SOURCE[0]} _tmux_fpp_run"
}

tmux_fpp() {
  local fpp_command=$1
  shift
  local pane_id=$(tmux run "echo #{pane_id}")
  tmux capture-pane -J -S - -E - -b "fpp-$pane_id" -t "$pane_id"
  tmux new-window -n fpp -c "#{pane_current_path}" "tmux show-buffer -b fpp-$pane_id \
    | fpp -c '$fpp_command' || true ; \
      tmux delete-buffer -b 'fpp-$pane_id'"
}

_tmux_fpp_copy_to_buffer() {
  tmux set-buffer "$(printf " '%s'" "${@}")"
}

_tmux_fpp_run() {
  tmux set-buffer "$(printf " '%s'" "${@}")"
  tmux command-prompt -p 'cmd:' "run 'cd #{pane_current_path};%%% ${@}'"
}

$1 "${@+${@:2}}"
