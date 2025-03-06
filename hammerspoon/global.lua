local function open_app(name)
  return function()
    hs.application.launchOrFocus(name)
    local app = hs.application.get(name)
    app:activate()
  end
end

-- Center window
hs.hotkey.bind({ 'alt', 'ctrl' }, 'E', function()
  hs.window.focusedWindow():maximize()
end)
hs.hotkey.bind({ 'alt', 'ctrl' }, 'L', function()
  hs.window.focusedWindow():moveToUnit { 0.1, 0, 0.9, 1 }
end)
hs.hotkey.bind({ 'alt', 'ctrl' }, 'H', function()
  hs.window.focusedWindow():maximize()
end)
-- Reload window
hs.hotkey.bind({ 'alt', 'ctrl' }, 'R', hs.reload)
-- Get the current time
hs.hotkey.bind({ 'alt', 'ctrl' }, 'T', function()
  -- Of the form: (ABBREV_DAY) (12 HOUR):(MINUTE)(AM/PM)
  local now = os.date '%a %I:%M%p'
  hs.alert.show(now)
end)

-- Open specific apps
hs.hotkey.bind({ 'alt', 'ctrl' }, 'I', open_app 'Ghostty')
hs.hotkey.bind({ 'alt', 'ctrl' }, 'C', open_app 'Spark Desktop')
hs.hotkey.bind({ 'alt', 'ctrl' }, 'D', open_app 'Things')
hs.hotkey.bind({ 'alt', 'ctrl' }, 'O', open_app 'Obsidian')
hs.hotkey.bind({ 'alt', 'ctrl' }, 'S', open_app 'Chromium')

-- Open Unity
hs.hotkey.bind({ 'alt', 'ctrl' }, 'U', function()
  if hs.appfinder.appFromName 'Unity' == nil then
    return
  end
  hs.application.launchOrFocus 'Unity'
  local unity = hs.application.get 'Unity'
  unity:activate()
end)
