if (( ! $+commands[peco] )); then
  return
fi


function tmux-fpp() {
    openssl rand -base64 6 | read rd
    set -l buffer_name "tmux-fpp-$rd"
    tmux capture-pane -J -b "$buffer_name"
    tmux show-buffer -b "$buffer_name" | fpp
    tmux delete-buffer -b "$buffer_name"
    #zle reset-prompt
}
zle -N tmux-fpp
