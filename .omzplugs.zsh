cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins

# alias-tips, gives a notification when an alias
git clone https://github.com/djui/alias-tips.git
# Autoupdates oh-my-zsh plugins
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
# Gives suggestions for commands
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
