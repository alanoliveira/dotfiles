# alanoliveira-dotifiles

## Dependencies
- git: https://git-scm.com/
- asdf: https://asdf-vm.com/
- nvim: https://neovim.io/
- tmux: https://github.com/tmux/tmux/wiki
- fzf: https://github.com/junegunn/fzf
- exa: https://the.exa.website/
- fd: https://github.com/sharkdp/fd
- ripgrep: https://github.com/BurntSushi/ripgrep
- font: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DroidSansMono

## Setup

- install the dependencies
- run
```
git clone --recurse-submodules --shallow-submodules https://github.com/alanoliveira/alanoliveira-dotifiles ~/dotfiles
make zsh
make nvim
make tmux
make git
```
- edit `~/.gitconfig.user`

### Linux

- keyboard mapping: [linux-keyboard-mapping.md](./linux-keyboard-mapping.md)


### Mac

- keyboard mapping: `make karabiner`
