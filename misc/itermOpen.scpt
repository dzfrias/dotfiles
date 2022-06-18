--Connected to CMD-Click in iTerm2. item 1 of argv will be the file that was
--clicked in the iTerm session. The setting is under Profiles->Advanced->
--Semantic History->Run command. The command is
--'osascript ~/.dotfiles/misc/itermOpen.scpt \1'


on run argv
    --Gets type of file. If it's a directory this will return 'directory'
    set fileType to do shell script "file " & item 1 of argv & " | cut -d' ' -f2"

    activate application "iTerm2"

    tell application "iTerm2"
        tell current session of current window
            --Checks if the file is not a directory
            if fileType ≠ "directory" then
                --Enters text in prompt
                write text "nvim " & item 1 of argv
            else
                write text "cd " & item 1 of argv
            end if

        end tell
    end tell
end run
