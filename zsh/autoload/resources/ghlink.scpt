-- Copies the username/reponame part of link of first tab to clipboard


tell application "Google Chrome"
    -- Get the url of the first tab
    set tab1 to get URL of tab 1 of first window
    if tab1 does not contain "https://github.com/" then
        error "Not on GitHub"
    end if
end tell

-- Get the username/reponame part of the url and copy to clipboard
set the clipboard to do shell script "echo " & tab1 & " | cut -d '/' -f4,5"
