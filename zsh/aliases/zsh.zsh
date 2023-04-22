# -GENERAL
alias ex='exit'
alias rl='exec zsh'
# Copies to clipboard
alias pb='pbcopy'
# To perform calculations
alias cc='noglob calc'
# List cron jobs
alias crnl='crontab -l'
# Edit crontab
alias crne='crontab -e'
alias chx='chmod +x'
alias rmr='rm -r'
alias rmrf='rm -rf'
alias srmr='sudo rm -r'
alias cpr='cp -R'
alias license='cp ~/.dotfiles/LICENSE .'
alias cl='j && clear'
# Clear mbox file
alias clmb='echo "" > ~/.mbox'
alias rec='mv "$HOME/Downloads/"$(cd ~/Downloads; ls -Art | tail -n 1) .'

# -CLI-OPTIONS-
# Doesn't open pager for bat (default is 'always' in misc/config/bat/config)
alias sbat='bat --paging=never'
# Long form, no owner, icons, no permissions, git status
alias exa='exa --long --header --no-user --icons --no-permissions --git'
alias ea='ea --group-directories-first'
alias ggl='google'
alias osd='osadict'
alias bndl='brew bundle dump --describe --force'
alias brwo='brew outdated'
alias almt='almostontop toggle'
alias byb='brew services restart yabai'
alias tki='tokei'
alias uty='/Applications/Unity/Hub/Editor/2021.3.15f1/Unity.app/Contents/MacOS/Unity -projectPath .'
