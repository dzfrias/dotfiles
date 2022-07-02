tell application "Google Chrome"
    -- Gets current url of active tab
    set currentUrl to get URL of active tab of first window
end tell

-- Copies current url to clipboard
set the clipboard to currentUrl
set message to "Copied to clipboard: " & currentUrl
do shell script "echo " & message
