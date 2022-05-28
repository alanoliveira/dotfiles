export DOTFILES="$HOME/dotfiles"
export EDITOR=nvim

source "$DOTFILES/zsh/.antigenrc"

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

for file in $DOTFILES/zsh/zshrc.d/**/*(.); do
    source "$file"
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $DOTFILES/zsh/.p10k.zsh ]] || source $DOTFILES/zsh/.p10k.zsh
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh
