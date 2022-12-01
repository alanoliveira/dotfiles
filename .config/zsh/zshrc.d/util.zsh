function util-open-on-browser() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    gh browse > /dev/null
  fi
}
zle -N util-open-on-browser
