-- Opens the current repo in GitHub on Google Chrome


tell application "Google Chrome"
    activate
    -- Get the name of the repository with the current owner
    set command to "gh repo view --json 'nameWithOwner' | sed -e 's/{\"nameWithOwner\"://g' -e 's/[\"}]//g'"
    -- Execute command and store output in repoName
    set repoName to do shell script command

    set repoUrl to "https://github.com/" & repoName
    -- Opens repoUrl in Google Chrome (see _ghopen.scpt)
    do shell script "osascript ~/.dotfiles/zsh/autoload/resources/_ghopen.scpt " & repoUrl
end tell
