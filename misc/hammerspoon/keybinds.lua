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
  hs.application.launchOrFocus('Google Chrome')
end)

-- Open iTerm
hs.hotkey.bind({ 'alt', 'ctrl' }, 'I', function()
  hs.application.launchOrFocus('Iterm')
end)

-- Toggle iTerm and Chrome
hs.hotkey.bind({ 'alt', 'ctrl' }, 'P', function()
  local chrome = hs.application.get('Google Chrome')
  local iterm = hs.application.get('iTerm2')
  if chrome:isFrontmost() then
    iterm:activate()
  elseif iterm:isFrontmost() then
    chrome:activate()
  end
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
