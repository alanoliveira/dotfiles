if (( ! $+commands[peco] )); then
  return
fi

ZSH_PECO_HISTORY_OPTS="--initial-filter=SmartCase"

function peco-select-history() {
  local QUERY=$BUFFER
  local PECO_RET=$(history -n 1 | tac | peco ${=ZSH_PECO_HISTORY_OPTS} --query "$QUERY")

  if [ ! -z "$PECO_RET" ]; then
    BUFFER=$PECO_RET
    CURSOR=$#PECO_RET # move cursor
  else
    BUFFER=$QUERY
  fi
}
zle -N peco-select-history

function peco-edit-file() {
  local PECO_RET=$(ag -l 2> /dev/null | peco ${=ZSH_PECO_HISTORY_OPTS})

  if [ ! -z "$PECO_RET" ]; then
    </dev/tty $EDITOR "$PECO_RET"
  fi
}
zle -N peco-edit-file

function peco-select-git-branch() {
  if ! git status &>/dev/null; then
    return
  fi

  local PECO_RET=$(git branch | cut -c 3- | peco ${=ZSH_PECO_HISTORY_OPTS})

  if [ ! -z "$PECO_RET" ]; then
    local LB=$LBUFFER
    local RB=$RBUFFER
    BUFFER=$LB$PECO_RET
    CURSOR=$#BUFFER
    BUFFER+=$RB
  fi
}
zle -N peco-select-git-branch

function peco-jump-to-z-dir() {
  local PECO_RET=$(z -l 2> /dev/null | sort -rn | cut -c 12- | peco ${=ZSH_PECO_HISTORY_OPTS})
  if [ ! -z "$PECO_RET" ]; then
    cd $PECO_RET
    zle reset-prompt
  fi
}
zle -N peco-jump-to-z-dir

function peco-kill-process () {
    local WANTED_PID=$(ps -ef | peco | awk '{ print $2 }')
    if [ ! -z "$WANTED_PID" ]; then
      kill $WANTED_PID
    fi
}
zle -N peco-kill-process
