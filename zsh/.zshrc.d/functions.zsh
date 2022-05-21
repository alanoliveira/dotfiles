function reload-source() {
    source ~/.zshrc
    zle clear-screen
}
zle -N reload-source
