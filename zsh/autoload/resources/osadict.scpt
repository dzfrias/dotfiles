-- osadict opens the dictionary selector for the Script Editor app


tell application "Script Editor" to activate

tell application "System Events" to tell process "Script Editor"
    tell menu bar item "File" of menu bar 1
        -- Click the 'Open Dictionary...' option
        click (menu item 1 where its name starts with "Open Dictionary") of menu 1
    end tell
end tell
