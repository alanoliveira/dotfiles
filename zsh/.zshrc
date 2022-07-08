export DOTFILES="$HOME/dotfiles"
export EDITOR=nvim

source "$DOTFILES/zsh/.zplugrc"
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'

case "$OSTYPE" in
    darwin*)
        alias tac='tail -r'
        ;;
    linux*)
        alias fd=fdfind
        ;;
esac

alias ls=exa
alias ll='ls -alF --icons'
alias vi=vim
alias vim=nvim

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

for file in $DOTFILES/zsh/zshrc.d/**/*(.); do
    source "$file"
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $DOTFILES/zsh/.p10k.zsh ]] || source $DOTFILES/zsh/.p10k.zsh
