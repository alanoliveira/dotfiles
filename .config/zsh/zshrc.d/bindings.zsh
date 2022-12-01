bindkey -v
bindkey '^r'    fzf-select-history-widget
bindkey '^t'    fzf-select-file-widget
bindkey '^[c'   fzf-jump-to-z-dir-widget
bindkey '^xb'   fzf-select-git-branch-widget
bindkey '^xk'   fzf-kill-process-widget
bindkey '^e'    autosuggest-clear
bindkey '^f'    forward-char
bindkey '^b'    backward-char

# remove undesired self-inserts
bindkey -r "^K"
bindkey -r "^Y"
bindkey -r "^Z"
bindkey -r "^O"
bindkey -r "^C"
