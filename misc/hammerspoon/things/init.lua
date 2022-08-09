local u = require 'util'

local down = hs.hotkey.new({ 'ctrl' }, 'J', function()
  u.key_stroke('Down')
end)

local up = hs.hotkey.new({ 'ctrl' }, 'K', function()
  u.key_stroke('Up')
end)

local out_of = hs.hotkey.new({ 'ctrl' }, 'H', function()
  u.key_stroke({ 'cmd' }, 'Left')
end)

local into = hs.hotkey.new({ 'ctrl' }, 'L', function()
  u.key_stroke('Return')
end)

local reorder_up = hs.hotkey.new({ 'ctrl', 'shift' }, 'K', function()
  u.key_stroke({ 'cmd' }, 'Up')
end)

local reorder_down = hs.hotkey.new({ 'ctrl', 'shift' }, 'J', function()
  u.key_stroke({ 'cmd' }, 'Down')
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

u.app_wf('Things', keybinds)
