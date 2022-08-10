# -GENERAL-
alias ex='exit'
alias ls='ls -G'
alias reload='exec zsh'
# In case of mistype
alias relaod='reload'
alias rl='reload'
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
alias srmr='sudo rm -r'
alias cpr='cp -R'
alias license='cp ~/.dotfiles/LICENSE .'
alias hs='j ~/.dotfiles/hammerspoon'
alias cl='j && clear'

# -CLI-OPTIONS-
# Doesn't open pager for bat (default is 'always' in misc/config/bat/config)
alias sbat='bat --paging=never'
# Long form, no owner, icons, no permissions, git status
alias exa='exa --long --header --no-user --icons --no-permissions --git'
alias ggl='google'
alias osd='osadict'
alias bndl='brew bundle dump --describe --force'
alias brwo='brew outdated'
alias almt='almostontop toggle'
