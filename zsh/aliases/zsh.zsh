# -GENERAL
alias ex='exit'
alias rl='exec zsh'
# Copies to clipboard
alias pb='pbcopy'
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
# Clear mbox file
alias clmb='echo "" > ~/.mbox'
alias h='cd $(home)'
alias mkt='cd $(maketemp -d)'
alias ch='cd $(changedir)'

# - FZF -
alias fzfkill='ps | sed "1d" | fzf --with-nth 4.. | cut -w -f 1 | xargs kill'
alias rec="command exa ~/Downloads | fzf | xargs -I {} mv '$HOME/Downloads/{}' ."
alias ghv='gh repo list -q ".[].name" --json "name" | fzf | xargs -I {} gh repo view {} --web'

# -CLI-OPTIONS-
# Long form, no owner, icons, no permissions, git status
alias exa='exa --long --header --no-user --icons --no-permissions --git'
alias ea='ea --group-directories-first'
alias eaa='ea -a'
alias osd='osadict'
alias ls=' exa --group-directories-first'
alias cd='j'
alias bndl='brew bundle dump --describe --force'
alias tki='tokei'
alias req='/opt/homebrew/bin/http'
