local u = require('util')

local tabp = hs.hotkey.new({ 'ctrl' }, 'J', function()
  u.keyStroke({ 'cmd', 'alt' }, 'Left')
end)

local tabn = hs.hotkey.new({ 'ctrl' }, 'K', function()
  u.keyStroke({ 'cmd', 'alt' }, 'Right')
end)

local bookmarks = hs.hotkey.new({ 'ctrl' }, 'B', function()
  local old_pos = hs.mouse.absolutePosition()
  hs.eventtap.leftClick({ x = 141, y = 95 }, 0)
  hs.mouse.absolutePosition(old_pos)
end)

local up = hs.hotkey.new({ 'ctrl', 'shift' }, 'K', function()
  u.keyStroke('Up')
end)

local down = hs.hotkey.new({ 'ctrl', 'shift' }, 'J', function()
  u.keyStroke('Down')
end)

local keybinds = {
  tabp,
  tabn,
  bookmarks,
  up,
  down,
}

local chrome_wf = hs.window.filter.new('Google Chrome')
chrome_wf
    :subscribe({ hs.window.filter.windowFocused, hs.window.filter.windowVisible }, function()
      for _, keybind in ipairs(keybinds) do
        keybind:enable()
      end
    end)
    :subscribe(hs.window.filter.windowUnfocused, function()
      for _, keybind in ipairs(keybinds) do
        keybind:disable()
      end
    end)
