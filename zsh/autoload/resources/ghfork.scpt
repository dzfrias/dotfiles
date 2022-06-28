-- Forks the URL of the first tab and clones it locally


tell application "Google Chrome"
    -- Get the url of the first tab
    set tab1 to get URL of tab 1 of first window
    if tab1 does not contain "https://github.com/" then
        error "Not on GitHub"
    end if
end tell

tell application "iTerm" to activate

-- Fork the tab and clones it
do shell script "gh repo fork " & tab1 & ".git --clone"
