local function yabai(args, callback, stream_callback)
  if stream_callback == nil then
    stream_callback = function()
      return true
    end
  end
  hs.task
    .new('/opt/homebrew/bin/yabai', callback, stream_callback, args)
    :start()
end

local function yabai_or(args, or_args)
  hs.task
    .new('/opt/homebrew/bin/yabai', function(exit_code)
      if exit_code > 0 then
        yabai(or_args)
      end
    end, function()
      return false
    end, args)
    :start()
end

hs.hotkey.bind({ 'alt', 'ctrl' }, 'F', function()
  yabai { '-m', 'window', '--toggle', 'float', '--grid', '4:4:1:1:2:2' }
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'S', function()
  yabai {
    '-m',
    'space',
    '--focus',
    'school',
  }
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'B', function()
  hs.execute [[/opt/homebrew/bin/yabai -m space --layout "$(/opt/homebrew/bin/yabai -m query --spaces --space | /opt/homebrew/bin/jq -r 'if .type == "bsp" then "stack" else "bsp" end')"]]
  if
    hs.execute [[/opt/homebrew/bin/yabai -m query --spaces --space | /opt/homebrew/bin/jq .type]]
    == '"stack"\n'
  then
    yabai { '-m', 'config', 'window_opacity', 'off' }
  else
    yabai { '-m', 'config', 'window_opacity', 'on' }
  end
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'P', function()
  yabai_or({
    '-m',
    'window',
    '--focus',
    'stack.prev',
  }, { '-m', 'window', '--focus', 'stack.last' })
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'N', function()
  yabai_or({
    '-m',
    'window',
    '--focus',
    'stack.next',
  }, { '-m', 'window', '--focus', 'stack.first' })
end)

hs.hotkey.bind({ 'alt', 'ctrl', 'shift' }, 'N', function()
  yabai { '-m', 'space', '--create' }
  yabai { '-m', 'space', '--focus', 'last' }
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'R', function()
  yabai { '-m', 'space', '--destroy' }
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'H', function()
  yabai { '-m', 'window', '--focus', 'west' }
end)
hs.hotkey.bind({ 'alt', 'ctrl' }, 'L', function()
  yabai { '-m', 'window', '--focus', 'east' }
end)
hs.hotkey.bind({ 'alt', 'ctrl' }, 'K', function()
  yabai { '-m', 'window', '--focus', 'north' }
end)
hs.hotkey.bind({ 'alt', 'ctrl' }, 'J', function()
  yabai { '-m', 'window', '--focus', 'south' }
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'Left', function()
  yabai { '-m', 'window', '--swap', 'west' }
end)
hs.hotkey.bind({ 'alt', 'ctrl' }, 'Right', function()
  yabai { '-m', 'window', '--swap', 'east' }
end)
hs.hotkey.bind({ 'alt', 'ctrl' }, 'Up', function()
  yabai { '-m', 'window', '--swap', 'north' }
end)
hs.hotkey.bind({ 'alt', 'ctrl' }, 'Down', function()
  yabai { '-m', 'window', '--swap', 'south' }
end)

hs.hotkey.bind({ 'alt', 'ctrl', 'shift' }, 'L', function()
  yabai { '-m', 'window', '--resize', 'right:20:0' }
end)
hs.hotkey.bind({ 'alt', 'ctrl', 'shift' }, 'H', function()
  yabai { '-m', 'window', '--resize', 'right:-20:0' }
end)

hs.hotkey.bind({ 'alt', 'ctrl', 'shift' }, 'K', function()
  yabai { '-m', 'space', '--focus', 'next' }
end)
hs.hotkey.bind({ 'alt', 'ctrl', 'shift' }, 'J', function()
  yabai { '-m', 'space', '--focus', 'prev' }
end)
