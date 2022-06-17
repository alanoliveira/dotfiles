if (( ! $+commands[fzf])); then
  return
fi

__fzfcmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; } &&
    echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --reverse"

function fzf-select-history-widget() {
  local RET=$(history -n 1 | uniq | FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --tac --tiebreak=index --query '$BUFFER'" $(__fzfcmd))

  if [ ! -z "$RET" ]; then
    BUFFER=$RET
    CURSOR=$#RET # move cursor
  fi
  zle reset-prompt
}
zle -N fzf-select-history-widget

function fzf-kill-process-widget() {
  local WANTED_PID=$(ps -ef | FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS" $(__fzfcmd) | awk '{ print $2 }')
  if [ ! -z "$WANTED_PID" ]; then
    kill $WANTED_PID
  fi
  zle reset-prompt
}
zle -N fzf-kill-process-widget

function fzf-select-file-widget() {
  local RET=$(ag --ignore .git --hidden -l 2>/dev/null | FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS" $(__fzfcmd))
  if [ ! -z "$RET" ]; then
    local LB=$LBUFFER
    local RB=$RBUFFER
    BUFFER=$LB$RET
    CURSOR=$#BUFFER
    BUFFER+=$RB
  fi
  zle reset-prompt
}
zle -N fzf-select-file-widget

function fzf-select-git-branch-widget() {
  if ! git status &>/dev/null; then
    return
  fi

  local RET=$(git branch | cut -c 3- | FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS" $(__fzfcmd))

  if [ ! -z "$RET" ]; then
    local LB=$LBUFFER
    local RB=$RBUFFER
    BUFFER=$LB$RET
    CURSOR=$#BUFFER
    BUFFER+=$RB
  fi
  zle reset-prompt
}
zle -N fzf-select-git-branch-widget

function fzf-jump-to-z-dir-widget() {
  local RET=$(z -l 2>/dev/null | sort -rn | cut -c 12- | FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS" $(__fzfcmd))
  if [ ! -z "$RET" ]; then
    cd $RET
    zle reset-prompt
  fi
  zle reset-prompt
}
zle -N fzf-jump-to-z-dir-widget
