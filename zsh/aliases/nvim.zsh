# Edits zshrc
alias zrc="nvim $HOME/.zshrc"
# Edits extra zsh config file
alias ezrc="nvim $HOME/.dotfiles/zsh/extra.zsh"
# Edits nvim's init.vim
alias vrc="nvim $HOME/.dotfiles/config/nvim/init.vim"
# Views the file with a Markdown renderer
alias mrkd="command nvim $1 -c 'MarkdownPreview'"
alias plugc='nvim +PlugClean +qall'
alias plugi='nvim +PlugInstall +qall'
alias plugu='nvim +PlugUpdate +qall'
alias plugged='cd ~/.local/share/nvim/plugged'
