-- Center window
hs.hotkey.bind({ 'alt', 'ctrl' }, 'E', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.w / 2 - f.w / 2
  f.y = max.h / 2 - f.h / 2
  win:setFrame(f)
end)

-- Open Alacritty
hs.hotkey.bind({ 'alt', 'ctrl' }, 'I', function()
  hs.application.launchOrFocus 'Alacritty'
  local iterm = hs.application.get 'Alacritty'
  iterm:activate()
end)

-- Open Calendar
hs.hotkey.bind({ 'alt', 'ctrl' }, 'C', function()
  hs.application.launchOrFocus 'Calendar'
  local calendar = hs.application.get 'Calendar'
  calendar:activate()
end)

-- Open Things
hs.hotkey.bind({ 'alt', 'ctrl' }, 'D', function()
  hs.application.launchOrFocus 'Things'
  local things = hs.application.get 'Things'
  things:activate()
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'O', function()
  hs.application.launchOrFocus 'Obsidian'
  local obsidian = hs.application.get 'Obsidian'
  obsidian:activate()
end)

-- Open Firefox
hs.hotkey.bind({ 'alt', 'ctrl' }, 'S', function()
  hs.application.launchOrFocus 'Firefox'
  local firefox = hs.application.get 'Firefox'
  firefox:activate()
end)

-- Open Unity
hs.hotkey.bind({ 'alt', 'ctrl' }, 'U', function()
  if hs.appfinder.appFromName 'Unity' == nil then
    return
  end
  hs.application.launchOrFocus 'Unity'
  local unity = hs.application.get 'Unity'
  unity:activate()
end)

-- Get the current time
hs.hotkey.bind({ 'alt', 'ctrl' }, 'T', function()
  -- Of the form: (ABBREV_DAY) (12 HOUR):(MINUTE)(AM/PM)
  local now = os.date '%a %I:%M%p'
  hs.alert.show(now)
end)

-- Clear all notifications
hs.hotkey.bind({ 'alt', 'ctrl' }, 'X', function()
  hs.execute '/usr/bin/sqlite3 "$(/usr/bin/getconf DARWIN_USER_DIR)/com.apple.notificationcenter/db2/db" "DELETE FROM record;" && /usr/bin/killall NotificationCenter'
end)
