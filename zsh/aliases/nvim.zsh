alias n='nvim'
alias nm='nvimm'
alias no="nvim -c 'execute \"edit\" . MruGetFiles()[0]'"

# quick access
alias zrc="nvim $HOME/.zshrc"
alias ezrc="nvim $HOME/.dotfiles/zsh/extra.zsh"
alias vrc="nvim $HOME/.dotfiles/vim/nvim/init.vim"
alias evrc="nvim $HOME/.dotfiles/vim/vimrc"

# vim-plug
alias plug='cd ~/.local/share/nvim/plugged'
alias plugc='nvim +PlugClean'
alias plugi='nvim +PlugInstall'
alias plugu='nvim +PlugUpdate'
