-- Center window
hs.hotkey.bind({ 'alt', 'ctrl' }, 'E', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.w / 2 - f.w / 2
  f.y = max.h / 2 - f.h / 2
  win:setFrame(f)
end)

-- Open Safari
hs.hotkey.bind({ 'alt', 'ctrl' }, 'C', function()
  hs.application.launchOrFocus 'Safari'
  local safari = hs.application.get 'Safari'
  safari:activate()
end)

-- Open iTerm
hs.hotkey.bind({ 'alt', 'ctrl' }, 'I', function()
  hs.application.launchOrFocus 'iTerm'
  local iterm = hs.application.get 'iTerm2'
  iterm:activate()
end)

-- Open Things
hs.hotkey.bind({ 'alt', 'ctrl' }, 'D', function()
  hs.application.launchOrFocus 'Things'
  local iterm = hs.application.get 'Things'
  iterm:activate()
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'O', function()
  hs.application.launchOrFocus 'Obsidian'
  local obsidian = hs.application.get 'Obsidian'
  obsidian:activate()
end)

-- Toggle iTerm and Safari
hs.hotkey.bind({ 'alt', 'ctrl' }, 'P', function()
  local safari = hs.application.get 'Safari'
  local iterm = hs.application.get 'iTerm2'
  if safari:isFrontmost() then
    iterm:activate()
  elseif hs.application.get('Things'):isFrontmost() then
    iterm:activate()
  else
    safari:activate()
  end
end)

-- Get the current time
hs.hotkey.bind({ 'alt', 'ctrl' }, 'T', function()
  -- Of the form: (ABBREV_DAY) (12 HOUR):(MINUTE)(AM/PM)
  local now = os.date '%a %I:%M%p'
  hs.alert.show(now)
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
