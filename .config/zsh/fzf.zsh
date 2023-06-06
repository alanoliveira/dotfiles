if (( ! $+commands[fzf])); then
  return
fi

export FZF_TMUX=1
export FZF_DEFAULT_OPTS="--bind=ctrl-y:accept"

__fzfcmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; } &&
    echo "__fzftmux" || echo "fzf"
}

__fzftmux() {
  # sleep is necessary to avoid duplication (it only happens with fzf-tmux)
  fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- ; sleep 0.1
}

function fzf-select-history-widget() {
  # the extra parentheses is necessary to remove trailing blank spaces
  local RET=( $(\
    fc -rl 1 |\
    perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |\
    FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --tiebreak=index -n2.. --query=${(qqq)LBUFFER} +m"\
    $(__fzfcmd)\
  ) )

  if [ -n "$RET" ]; then
    local NUM=$RET[1]
    if [ -n "$NUM" ]; then
      zle vi-fetch-history -n $NUM
    fi
  fi
  zle reset-prompt
}
zle -N fzf-select-history-widget

function fzf-select-file-widget() {
  local RET=$(fd --type file --hidden --exclude .git 2>/dev/null | FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS" $(__fzfcmd))
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
