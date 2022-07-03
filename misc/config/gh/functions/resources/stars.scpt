-- Opens the GitHub stars page (see _open.scpt)


-- Get currently authenticated user
set user to do shell script "gh api -H 'Accept: application/vnd.github+json' /user --jq '.login'"
set starsLink to "https://github.com/" & user & "?tab=stars"

do shell script "osascript ~/.dotfiles/misc/config/gh/functions/resources/_open.scpt " & starsLink
