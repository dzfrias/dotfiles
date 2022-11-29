tell application "Safari"
    set theUrl to URL of current tab of window 1
end tell

set the clipboard to theUrl
