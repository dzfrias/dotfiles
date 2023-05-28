alias n='nvim'
alias nm='nvimm'
alias no='nvim -c "edit #<1"'
alias nd='nvim .'

# Quick access
alias zrc="nvim $HOME/.zshrc"
alias ezrc="nvim $HOME/.dotfiles/zsh/extra.zsh"
alias vrc='j ~/.dotfiles/vim/nvim/lua/dzfrias'
alias trc='nvim ~/.dotfiles/misc/tmux.conf'
alias evrc="nvim $HOME/.dotfiles/vim/vimrc"
alias nvdir='j ~/.local/share/nvim'
alias hs='j ~/.dotfiles/hammerspoon'
alias fn='nvim "+lua require(\"telescope.builtin\").find_files { cwd = require(\"dzfrias.util\").get_project_root() }"'
