xcode-select --install

git clone https://github.com/Diego17230/dotfiles.git ~/dotfiles

mkdir ~/.config

# Symlink home dotfiles
for file in ~/dotfiles/*; do
    ln -s $file ~/`basname $file`
done

# Symlink .config files
for file in ~/dotfiles/.config/*; do
    ln -s $file ~/.config/`basename $file`
done

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ~/dotfiles/Brewfile
