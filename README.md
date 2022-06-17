# Dotfiles
My important dotfiles! I wouldn't recommend cloning this repository directly, as it hasn't been tested yet. Configuring for Linux and Windows will definitely not work out of the box, as this is meant for macOS.


### Autoload
Any executable files in the `zsh/autoload` directly will be [autoloaded](https://zsh.sourceforge.io/Doc/Release/Functions.html#Autoloading-Functions).


### Symlinks
To add files to the symlink script, edit `setup/resources/symlink.txt`. All lines should be of the form `SRC DEST` where `SRC` is the file or glob pattern in `~/.dotfiles` to be symlinked and `DEST` is the destination. `DEST` is optional, and if it is not specified, `SRC` will be symlinked into `$HOME` with a `.` prepended to its name. These files will be symlinked when `bootstrap.sh` is run.

**Examples:**
- `zsh/zshrc` turns into `ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc`
- `vim/ftplugin ~/.vim` turns into `ln -s ~/.dotfiles/vim/ftplugin ~/.vim`
- `git/*` turns into `ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig` and `ln -s ~/.dotfiles/git/gitignore ~/.gitignore` along with any other files in the `git` directory.


### Executables
To add files to the executables script, edit `setup/resources/executables.txt`. All lines should be of the form `FILE_OR_GLOB`. Any file or glob pattern specified will be made executable when `bootstrap.sh` is run.


### Cron
The contents of `setup/resources/cron.txt` will be put into the user's crontab when `bootstrap.sh` is run.
