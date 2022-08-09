local u = require 'util'

local down = hs.hotkey.new({ 'ctrl' }, 'J', function()
  u.keyStroke('Down')
end)

local up = hs.hotkey.new({ 'ctrl' }, 'K', function()
  u.keyStroke('Up')
end)

local out_of = hs.hotkey.new({ 'ctrl' }, 'H', function()
  u.keyStroke({ 'cmd' }, 'Left')
end)

local into = hs.hotkey.new({ 'ctrl' }, 'L', function()
  u.keyStroke('Return')
end)

local reorder_up = hs.hotkey.new({ 'ctrl', 'shift' }, 'K', function()
  u.keyStroke({ 'cmd' }, 'Up')
end)

local reorder_down = hs.hotkey.new({ 'ctrl', 'shift' }, 'J', function()
  u.keyStroke({ 'cmd' }, 'Down')
end)

local school = hs.hotkey.new({ 'cmd' }, '8', function()
  hs.eventtap.keyStroke({ 'cmd' }, 'F')
  hs.eventtap.keyStrokes('school')
  hs.eventtap.keyStroke({}, 'Return')
end)

local coding = hs.hotkey.new({ 'cmd' }, '9', function()
  hs.eventtap.keyStroke({ 'cmd' }, 'F')
  hs.eventtap.keyStrokes('coding')
  hs.eventtap.keyStroke({}, 'Return')
end)

local keybinds = {
  down,
  up,
  out_of,
  into,
  reorder_up,
  reorder_down,
  school,
  coding,
}

local things_wf = hs.window.filter.new('Things')
things_wf
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
