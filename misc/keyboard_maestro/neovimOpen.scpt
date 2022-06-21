--Opens the frontmost file in the Xcode editor in neovim


tell application "Xcode"
    --Gets the flie being edited by Xcode
    set filePath to get path of file document 1
    --Surrounds in quotes
    set filePath to "'" & filePath & "'"
    --Get directory of file
    set fileDirectory to do shell script "dirname " & filePath
    set fileDirectory to "'" & fileDirectory & "'"
end tell

tell application "iTerm2"
    set windowName to name of current window
    activate
    --Checks if user is in home directory
    if last item of windowName ≠ "~" then
        --Creates a new tab
        tell current window to create tab with default profile
    end if
    tell current session of current window
        --Goes to directory
        write text "cd " & fileDirectory
        --Delay so prompt can finish appearing (would cause bug otherwise)
        delay 1
        --Edits with neovim
        write text "nvim " & filePath
    end tell
end tell
