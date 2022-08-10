-- Center window
hs.hotkey.bind({ 'alt', 'ctrl' }, 'E', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.w / 2 - f.w / 2
  f.y = max.h / 2 - f.h / 2
  win:setFrame(f)
end)

-- Open Chrome
hs.hotkey.bind({ 'alt', 'ctrl' }, 'C', function()
  hs.application.launchOrFocus 'Google Chrome'
  local chrome = hs.application.get 'Google Chrome'
  chrome:activate()
end)

-- Open iTerm
hs.hotkey.bind({ 'alt', 'ctrl' }, 'I', function()
  hs.application.launchOrFocus 'iTerm'
  local iterm = hs.application.get 'iTerm2'
  iterm:activate()
end)

-- Toggle iTerm and Chrome
hs.hotkey.bind({ 'alt', 'ctrl' }, 'P', function()
  local chrome = hs.application.get 'Google Chrome'
  local iterm = hs.application.get 'iTerm2'
  if chrome:isFrontmost() then
    iterm:activate()
  elseif iterm:isFrontmost() then
    chrome:activate()
  end
end)

-- Get current mouse position
hs.hotkey.bind({ 'alt', 'ctrl' }, 'M', function()
  local mouse = hs.mouse.absolutePosition()
  local x = math.floor(mouse.x)
  local y = math.floor(mouse.y)
  hs.alert.show(x .. ', ' .. y)
end)

-- Toggle Hammerspoon console
hs.hotkey.bind({ 'alt', 'ctrl' }, 'H', function()
  local hs_console = hs.appfinder.appFromName 'Hammerspoon'
  if #hs_console:visibleWindows() == 0 then
    hs.application.open 'Hammerspoon'
    hs.application.get('iTerm2'):activate()
  else
    hs_console:hide()
  end
end)

-- Go to lock screen
hs.hotkey.bind({ 'alt', 'ctrl' }, 'L', function()
  hs.caffeinate.lockScreen()
end)

-- Clear all notifications
hs.hotkey.bind({ 'alt', 'ctrl' }, 'N', function()
  hs.applescript [[
  activate application "NotificationCenter"
  tell application "System Events"
      tell process "Notification Center"
          repeat
              
              try
                  set theWindow to group 1 of UI element 1 of scroll area 1 of window "Notification Center"
              on error
                  exit repeat
              end try
              
              try
                  set theActions to actions of theWindow
                  
                  # Try to close the whole group first. If that fails, close individual windows.
                  repeat with theAction in theActions
                      if description of theAction is "Clear All" then
                          set closed to true
                          tell theWindow
                              perform theAction
                          end tell
                          exit repeat
                      end if
                  end repeat
                  
                  repeat with theAction in theActions
                      if description of theAction is "Close" then
                          set closed to true
                          tell theWindow
                              perform theAction
                          end tell
                          exit repeat
                      end if
                  end repeat
                  
              end try
          end repeat
      end tell
  end tell
  ]]
end)

-- Toggle iTerm and Chrome vertical split
hs.hotkey.bind({ 'alt', 'ctrl' }, 'D', function()
  local chrome = hs.appfinder.appFromName('Google Chrome'):mainWindow()
  local iterm = hs.appfinder.appFromName('iTerm2'):mainWindow()
  if not chrome:isFullScreen() or not iterm:isFullScreen() then
    chrome:setFullScreen(true)
    iterm:setFullScreen(true)
    return
  end
  chrome:setFullScreen(false)
  iterm:setFullScreen(false)

  local screen = hs.screen.mainScreen():name()
  local windowLayout = {
    { 'iTerm2', nil, screen, hs.layout.left50, nil, nil },
    { 'Google Chrome', nil, screen, hs.layout.right50, nil, nil },
  }
  hs.layout.apply(windowLayout)
end)
