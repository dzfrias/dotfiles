xcode-select --install

git clone https://github.com/Diego17230/dotfiles.git ~/dotfiles

mkdir ~/.config

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file $HOME/dotfiles/Brewfile

# Symlink home dotfiles that don't end in .zsh
for file in $(find ~/dotfiles -type f -name '.*' -not -path '*.zsh'); do
    ln -s $file ~/`basname $file`
done

# Symlink .config files
for file in ~/dotfiles/.config/*; do
    ln -s $file $HOME/.config/`basename $file`
done

# Install oh-my-zsh and keep the current zshrc
export KEEP_ZSHRC='yes'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Clone the non-core plugins
source $HOME/dotfiles/.omzplugs.zsh

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
command nvim -c 'PlugInstall'

# Convenient symlink
ln -s $HOME/Library/Mobile Documents/com~apple~CloudDocs $HOME/iCloud

touch $HOME/.extra_zsh.zsh
