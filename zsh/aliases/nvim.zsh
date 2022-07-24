alias n='nvim'
alias nm='nvimm'
# Edits zshrc
alias zrc="nvim $HOME/.zshrc"
# Edits extra zsh config file
alias ezrc="nvim $HOME/.dotfiles/zsh/extra.zsh"
# Edits init.vim
alias vrc="nvim $HOME/.dotfiles/vim/nvim/init.vim"
# Edits vimrc
alias evrc="nvim $HOME/.dotfiles/vim/vimrc"
# Views the file with a Markdown renderer
alias mrkd="command nvim $1 -c 'MarkdownPreview'"
alias plugc='nvim +PlugClean +qall'
alias plugi='nvim +PlugInstall +qall'
alias plugu='nvim +PlugUpdate +qall'
# Goes to directory with plugins
alias plugged='cd ~/.local/share/nvim/plugged'
