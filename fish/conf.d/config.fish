set -x DOTFILES "$HOME/dotfiles"
set -x EDITOR 'vim'
set -x PATH $PATH "$HOME/.anyenv/bin"

# env
if type -q 'anyenv'
    status --is-interactive; and source (anyenv init -|psub)
end
if type -q 'direnv'
    eval (direnv hook fish)
end

# aliases
alias ls=exa
alias ll='ls -alF --icons'
alias vi=vim
alias vim=nvim
