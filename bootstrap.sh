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

# Install oh-my-zsh and keep the current zshrc
export KEEP_ZSHRC='yes'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Clone the non-core plugins
source .omzplugs.zsh

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
