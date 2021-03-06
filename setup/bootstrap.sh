#!/bin/zsh

# Installs xcode
xcode-select --install

git clone https://github.com/dzfrias/dotfiles.git ~/.dotfiles

mkdir ~/.config

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ~/.dotfiles/setup/Brewfile

# Symlink files from ~/.dotfiles
zsh ~/.dotfiles/setup/symlink.zsh

# Install oh-my-zsh and keep the current zshrc
export KEEP_ZSHRC='yes'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Clone the non-core plugins
zsh ~/.dotfiles/setup/omzplugs.zsh

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
# Sets crontab to crontab file minus the first two lines
crontab <(cat ~/.dotfiles/setup/resources/crontab | sed '1,2d')
# All files in here will be removed every day
mkdir ~/.temporary

# Set macOS defaults
zsh ~/.dotfiles/misc/macos.zsh
