# Autoloads every file in the autoload directory

# Adds directory to fpath
fpath=("$HOME/.dotfiles/zsh/autoload" $fpath)

# Autloads all regular files
autoload ~/.dotfiles/zsh/autoload/*(.)
