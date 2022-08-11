local u = require 'util'

local quit = hs.hotkey.new({ 'ctrl' }, 'Q', function()
  hs.eventtap.keyStrokes 'cl'
  u.key_stroke 'Return'
  hs.caffeinate.lockScreen()
end)

local keybinds = {
  quit,
}

u.app_wf('iTerm2', keybinds)
