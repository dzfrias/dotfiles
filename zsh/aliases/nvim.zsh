alias n='nvim'
alias nm='nvimm'
alias no="nvim -c 'execute \"edit\" . MruGetFiles()[0]'"

# Quick access
alias zrc="nvim $HOME/.zshrc"
alias ezrc="nvim $HOME/.dotfiles/zsh/extra.zsh"
alias vrc="j ~/.dotfiles/vim/nvim/lua"
alias evrc="nvim $HOME/.dotfiles/vim/vimrc"

# packer.nvim
alias pack='cd ~/.local/share/nvim/site/pack/packer/start'
alias packc='nvim +PackerClean'
alias packi='nvim +PackerInstall'
alias packu='nvim +PackerUpdate'
