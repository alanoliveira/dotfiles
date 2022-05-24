# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES="$HOME/dotfiles"
export EDITOR=nvim

source "$DOTFILES/zsh/.antigenrc"

case "$OSTYPE" in
  darwin*)
      alias tac='tail -r'
  ;;
  linux*)
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
