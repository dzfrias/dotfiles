-- cpurl copies the current url of the first tab of google chrome to clipboard


tell application "Google Chrome"
    -- Get current url of active tab
    set currentUrl to get URL of active tab of first window
end tell

-- Copy current url to clipboard
set the clipboard to currentUrl
set message to "Copied to clipboard: " & currentUrl
do shell script "echo " & message
