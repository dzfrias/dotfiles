-- Opens the GitHub stars page (see _ghopen.scpt)


-- Get currently authenticated user
set user to do shell script "gh api -H 'Accept: application/vnd.github+json' /user --jq '.login'"
set starsLink to "https://github.com/" & user & "?tab=stars"

do shell script "osascript ~/.dotfiles/zsh/autoload/resources/_ghopen.scpt " & starsLink
