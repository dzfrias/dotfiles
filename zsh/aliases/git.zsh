# -GIT-
# Alias for committing with a message and adding all
alias gcm='gcam'
# Makes bat the diff pager with no styling
alias gd='git diff | bat --plain'
# Amend git commit
alias gamm='git commit --amend'
# Counts all commits made on the current day
alias gtod='git rev-list --count --after=today00:00:00 --all'
alias gc='git add --all && git commit --verbose'
alias gprv='git push && repoview'

# -GITHUB-
alias ghl='ghlink'
alias ghf='ghfork'
alias ghn='newrepo'
alias ghs='ghstars'
alias rpv='repoview'
