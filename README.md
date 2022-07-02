# Dotfiles
My important dotfiles! I wouldn't recommend cloning this repository directly, as it hasn't been tested yet. Configuring for Linux and Windows will definitely not work out of the box.


### Autoload
Any files in the [zsh/autoload](https://github.com/dzfrias/dotfiles/tree/main/zsh/autoload) directly will be [autoloaded](https://zsh.sourceforge.io/Doc/Release/Functions.html#Autoloading-Functions).


### Symlinks
To add files to the symlink script, edit [setup/resources/symlink.txt](https://github.com/dzfrias/dotfiles/blob/main/setup/symlink.zsh). All lines should be of the form `SRC DEST` where `SRC` is the file or glob pattern in `~/.dotfiles` to be symlinked and `DEST` is the destination. `DEST` is optional, and if it is not specified, `SRC` will be symlinked into `$HOME` with a `.` prepended to its name. These files will be symlinked when [setup/bootstrap.sh](https://github.com/dzfrias/dotfiles/blob/main/setup/bootstrap.sh) is run.

**Examples:**
- `zsh/zshrc` turns into `ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc`
- `vim/ftplugin ~/.vim` turns into `ln -s ~/.dotfiles/vim/ftplugin ~/.vim`
- `git/*` turns into `ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig` and `ln -s ~/.dotfiles/git/gitignore ~/.gitignore` along with any other files in the `git` directory.


### Cron
The contents of [setup/resources/crontab](https://github.com/dzfrias/dotfiles/blob/main/setup/resources/crontab) will be put into the user's crontab when [setup/bootstrap.sh](https://github.com/dzfrias/dotfiles/blob/main/setup/bootstrap.sh) is run.


### Aliases
Any files in the [zsh/aliases](https://github.com/dzfrias/dotfiles/tree/main/zsh/aliases) directory will be sourced when [.zshrc](https://github.com/dzfrias/dotfiles/blob/main/zsh/zshrc) is run.
