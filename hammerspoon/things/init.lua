local u = require 'util'

-- Go down
local down = hs.hotkey.new({ 'ctrl' }, 'J', function()
  u.key_stroke 'Down'
end)

-- Go up
local up = hs.hotkey.new({ 'ctrl' }, 'K', function()
  u.key_stroke 'Up'
end)

-- Go out of current scope
local out_of = hs.hotkey.new({ 'ctrl' }, 'H', function()
  u.key_stroke({ 'cmd' }, 'Left')
end)

-- Go into a nested scope
local into = hs.hotkey.new({ 'ctrl' }, 'L', function()
  u.key_stroke 'Return'
end)

-- Reorder item up
local reorder_up = hs.hotkey.new({ 'ctrl', 'shift' }, 'K', function()
  u.key_stroke({ 'cmd' }, 'Up')
end)

-- Reorder item down
local reorder_down = hs.hotkey.new({ 'ctrl', 'shift' }, 'J', function()
  u.key_stroke({ 'cmd' }, 'Down')
end)

-- Go to the `School` area
local school = hs.hotkey.new({ 'cmd' }, '8', function()
  hs.eventtap.keyStroke({ 'cmd' }, 'F')
  hs.eventtap.keyStrokes 'school'
  hs.eventtap.keyStroke({}, 'Return')
end)

-- Go to the `Coding` area
local coding = hs.hotkey.new({ 'cmd' }, '9', function()
  hs.eventtap.keyStroke({ 'cmd' }, 'F')
  hs.eventtap.keyStrokes 'coding'
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

require('app_wf').add_app_wf('Things', keybinds)
