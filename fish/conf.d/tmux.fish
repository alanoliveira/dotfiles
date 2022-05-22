function tmux_fpp
    if test -z $TMUX
        return 0
    end
    openssl rand -base64 6 | read rd
    set -l buffer_name "tmux-fpp-$rd"
    tmux capture-pane -J -b "$buffer_name"
    tmux show-buffer -b "$buffer_name" | fpp
    tmux delete-buffer -b "$buffer_name"
    commandline -f repaint
end

