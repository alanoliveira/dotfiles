function util-open-on-browser() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    gh browse > /dev/null
  fi
}
zle -N util-open-on-browser

# used to 'redraw' multi-line prompts (like p10k)
function zle-hard-reset() {
  zle push-line
  zle accept-line
}
zle -N zle-hard-reset
