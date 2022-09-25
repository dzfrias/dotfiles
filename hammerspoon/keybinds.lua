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
  else
    chrome:activate()
  end
end)

-- Get the current time
hs.hotkey.bind({ 'alt', 'ctrl' }, 'T', function()
  -- Of the form: (ABBREV_DAY) (12 HOUR):(MINUTE)(AM/PM)
  local now = os.date '%a %I:%M%p'
  hs.alert.show(now)
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
  tell application "System Events" to tell process "Notification Center"
    -- Get frontmost notification
    set notif to group 1 of UI element 1 of scroll area 1 of window "Notification Center"
    -- Perform action to clear notification or clear all notifications
    perform action 4 of notif
  end tell
  ]]
end)
