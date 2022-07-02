on run argv
    tell application "Google Chrome"
        -- Gets the url of the first tab
        set tab1 to get URL of tab 1 of first window
        if tab1 contains "https://github.com/" then
            -- Set the url of the first tab to the first argument
            set (URL of tab 1 of first window) to item 1 of argv
            -- Switch to tab 1
            set active tab index of first window to 1
        end if
    end tell
end run
