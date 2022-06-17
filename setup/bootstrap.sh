#!/bin/zsh

# Installs xcode
xcode-select --install

git clone https://github.com/Diego17230/dotfiles.git ~/.dotfiles

mkdir ~/.config

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ~/.dotfiles/setup/Brewfile

# Symlink files from ~/.dotfiles
zsh ~/.dotfiles/setup/symlink.zsh
# Makes appropriate files executable
zsh ~/.dotfiles/setup/executables.zsh

# Install oh-my-zsh and keep the current zshrc
export KEEP_ZSHRC='yes'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Clone the non-core plugins
zsh ~/.dotfiles/zsh/omzplugs.zsh

# Install a script for vim-plug
curl -fLo ~/.dotfiles/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Installs all plugins in init.vim
command nvim -c 'PlugInstall'

# Convenient symlink
ln -s ~/Library/Mobile Documents/com~apple~CloudDocs ~/iCloud

# Personal config file
touch ~/.dotfiles/zsh/extra.zsh

# Sets crontab to cron.txt
crontab ~/.dotfiles/setup/resources/cron.txt
