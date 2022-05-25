if (( ! $+commands[peco] )); then
  return
fi


function tmux-fpp() {
    local buffer_name="tmux-fpp-$TMUX_PANE"
    tmux capture-pane -J -b "$buffer_name"
    tmux show-buffer -b "$buffer_name" | fpp || true
    tmux delete-buffer -b "$buffer_name"
    echo
    zle reset-prompt
}
zle -N tmux-fpp
