tmux_util_create_dotfiles_session() {
    local tmux_sessions=$(tmux list-sessions -F '#{session_name}')
    local dotfiles_session='dotfiles'
    if ! tmux list-sessions -F '#{session_name}' | grep -q $dotfiles_session
    then
        tmux new-session -d -c $DOTFILES -s $dotfiles_session
    fi
    tmux switch-client -t $dotfiles_session
}

$1
