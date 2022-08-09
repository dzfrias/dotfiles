local u = require('util')

local tabp = hs.hotkey.new({ 'ctrl' }, 'J', function()
  u.keyStroke({ 'cmd', 'alt' }, 'Left')
end)

local tabn = hs.hotkey.new({ 'ctrl' }, 'K', function()
  u.keyStroke({ 'cmd', 'alt' }, 'Right')
end)

local keybinds = {
  tabp,
  tabn,
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
