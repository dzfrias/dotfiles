# Alias for committing with a message and adding all
alias gcm='gcam'
# Makes bat the diff pager with no styling
alias gd='git diff | bat --plain'
# Amend git commit
alias gamm='git commit --amend'
# Counts all commits made on the current day
alias gtod='git rev-list --count --after=today00:00:00 --all'

# Creates a new repo in a plain directory
alias newrepo='git init && gh repo create && git push --set-upstream origin main'
