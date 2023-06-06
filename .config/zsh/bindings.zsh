bindkey -v
bindkey '^r'    fzf-select-history-widget
bindkey '^t'    fzf-select-file-widget
bindkey '^[c'   fzf-jump-to-z-dir-widget
bindkey '^e'    autosuggest-clear
bindkey '^f'    forward-char
bindkey '^b'    backward-char
bindkey '^y'    autosuggest-accept

# remove undesired self-inserts
bindkey -r "^K"
bindkey -r "^Z"
bindkey -r "^O"
bindkey -r "^C"
