local u = require 'util'

-- Go down
local down = hs.hotkey.new({ 'ctrl' }, 'J', function()
  u.key_stroke 'Down'
end)

-- Go up
local up = hs.hotkey.new({ 'ctrl' }, 'K', function()
  u.key_stroke 'Up'
end)

local keybinds = {
  down,
  up,
}

require('app_wf').add('Unity', keybinds)
