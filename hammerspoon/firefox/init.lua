local u = require 'util'

local tabright = hs.hotkey.new({ 'ctrl' }, 'K', function()
  u.key_stroke({ 'cmd', 'shift' }, ']')
end)

local tableft = hs.hotkey.new({ 'ctrl' }, 'J', function()
  u.key_stroke({ 'cmd', 'shift' }, '[')
end)

local keybinds = {
  tabright,
  tableft,
}

require('app_wf').add('Firefox', keybinds)
