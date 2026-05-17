#!/usr/bin/osascript

on run argv
    tell application "Safari"
        -- Get the URL of the frontmost tab
        set currentTab to current tab of front window
        set currentURL to URL of currentTab
        
        -- Check if the URL is a GitHub repository
        if currentURL starts with "https://github.com/" then
            -- Extract the repository path
            set githubPrefix to "https://github.com/"
            set repoPath to text (length of githubPrefix + 1) thru -1 of currentURL
            
            -- Handle different GitHub URL patterns
            if currentURL contains "/blob/" then
                -- File view URL
                set AppleScript's text item delimiters to "/"
                set pathComponents to text items of repoPath
                if (count of pathComponents) ≥ 4 then
                    set repoOwner to item 1 of pathComponents
                    set repoName to item 2 of pathComponents
                    
                    -- Rebuild the file path
                    set filePath to ""
                    repeat with i from 5 to count of pathComponents
                        set filePath to filePath & "/" & (item i of pathComponents)
                    end repeat
                    
                    -- Construct Sourcegraph file URL
                    set sourcegraphURL to "https://sourcegraph.com/github.com/" & repoOwner & "/" & repoName & "/-/blob" & filePath
                    
                    -- Open and switch to new tab
                    set newTab to make new tab at after currentTab with properties {URL: sourcegraphURL}
                    set current tab of front window to newTab
                else
                    display dialog "This doesn't appear to be a valid GitHub file URL."
                end if
            else if currentURL contains "/tree/" then
                -- Directory tree view URL
                set AppleScript's text item delimiters to "/"
                set pathComponents to text items of repoPath
                if (count of pathComponents) ≥ 4 then
                    set repoOwner to item 1 of pathComponents
                    set repoName to item 2 of pathComponents
                    
                    -- Rebuild the directory path
                    set dirPath to ""
                    repeat with i from 5 to count of pathComponents
                        set dirPath to dirPath & "/" & (item i of pathComponents)
                    end repeat
                    
                    -- Construct Sourcegraph directory URL
                    set sourcegraphURL to "https://sourcegraph.com/github.com/" & repoOwner & "/" & repoName & "/-/tree" & dirPath
                    
                    -- Open and switch to new tab
                    set newTab to make new tab at after currentTab with properties {URL: sourcegraphURL}
                    set current tab of front window to newTab
                else
                    display dialog "This doesn't appear to be a valid GitHub directory URL."
                end if
            else
                -- Repository root URL
                set AppleScript's text item delimiters to "/"
                set pathComponents to text items of repoPath
                if (count of pathComponents) ≥ 2 then
                    set repoOwner to item 1 of pathComponents
                    set repoName to item 2 of pathComponents
                    
                    -- Construct Sourcegraph URL
                    set sourcegraphURL to "https://sourcegraph.com/github.com/" & repoOwner & "/" & repoName
                    
                    -- Open and switch to new tab
                    set newTab to make new tab at after currentTab with properties {URL: sourcegraphURL}
                    set current tab of front window to newTab
                else
                    display dialog "This doesn't appear to be a GitHub repository URL."
                end if
            end if
        else
            display dialog "This doesn't appear to be a GitHub page."
        end if
    end tell
end run
