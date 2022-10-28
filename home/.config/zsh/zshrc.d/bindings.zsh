bindkey -v
bindkey '^r'    fzf-select-history-widget
bindkey '^t'    fzf-select-file-widget
bindkey '^[c'   fzf-jump-to-z-dir-widget
bindkey '^xb'   fzf-select-git-branch-widget
bindkey '^xk'   fzf-kill-process-widget
bindkey '^f'    autosuggest-accept
bindkey '^y'    autosuggest-accept
bindkey '^b'    util-open-on-browser

for b in $(bindkey | grep self-insert | cut -d'"' -f2)
do
  bindkey -r "$b"
done
