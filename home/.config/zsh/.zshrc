export VI_MODE_SET_CURSOR=true
export EDITOR=nvim
export MANPAGER='nvim +Man!'
export WORDCHARS=$WORDCHARS:s:/:
export VIMWIKI_PATH=$HOME/Dropbox/vimwiki/

source "$XDG_CONFIG_HOME/zsh/.zplugrc"
source "$XDG_CONFIG_HOME/asdf-direnv/zshrc"

typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'

case "$OSTYPE" in
    darwin*)
        alias tac='tail -r'
        ;;
    linux*)
        ;;
esac

alias ls=exa
alias ll='ls -alF --icons'
alias e=$EDITOR
alias lg=lazygit
alias vimwiki='nvim -c VimwikiIndex'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

for file in $XDG_CONFIG_HOME/zsh/zshrc.d/**/*(.); do
    source "$file"
done

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

$XDG_CONFIG_HOME/scripts/tmux-start.sh
