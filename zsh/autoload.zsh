# Autoloads every file in the autoload directory

# Adds directory to fpath
fpath=("$HOME/.dotfiles/zsh/autoload" $fpath)

for file in ~/.dotfiles/zsh/autoload/*; do
  # Checks if file is not a directory
  if [[ ! -d $file ]]; then
    # Loads the file as a zsh function
    autoload $file
  fi
done
