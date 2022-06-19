--Opens the current repo in GitHub on Google Chrome


tell application "Google Chrome"
    --Get the name of the repository with the current owner
    set command to "gh repo view --json 'nameWithOwner' | sed -e 's/{\"nameWithOwner\"://g' -e 's/[\"}]//g'"
    --Execute command and store output in repoName
    set repoName to do shell script command

    --Gets the url of the first tab
    set tab1 to get URL of tab 1 of first window
    if tab1 contains "https://github.com/" then
        --Set the url of the first tab to the repo
        set (URL of tab 1 of first window) to "https://github.com/" & repoName
        --Switch to tab 1
        set active tab index of first window to 1
    end if
end tell
