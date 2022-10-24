local yabai = function(args)
  local yabai_stdout = ''
  local yabai_stderr = ''
  local yabai_task = hs.task.new(
    '/opt/homebrew/bin/yabai',
    function() end,
    function(_, stdout, stderr)
      print(stdout)
      print(stderr)
      yabai_stdout = yabai_stdout .. stdout
      yabai_stderr = yabai_stderr .. stderr
      return true
    end,
    args
  )
  yabai_task:start()
  return { yabai_stdout, yabai_stderr }
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
  -- yabai -m query --spaces --space | jq .type
  print(
    hs.execute '/opt/homebrew/bin/yabai -m query --spaces --space | /opt/homebrew/bin/jq .type'
  )
  -- yabai {
  --   '-m',
  --   'config',
  --   'layout',
  --   'stack',
  -- }
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'P', function()
  yabai {
    '-m',
    'window',
    '--focus',
    'stack.prev',
    '||',
    'yabai',
    '-m',
    'window',
    '--focus',
    'prev',
  }
end)

hs.hotkey.bind({ 'alt', 'ctrl' }, 'N', function()
  yabai {
    '-m',
    'window',
    '--focus',
    'stack.next',
    '||',
    'yabai',
    '-m',
    'window',
    '--focus',
    'next',
  }
end)

hs.hotkey.bind({ 'alt', 'ctrl', 'shift' }, 'N', function()
  yabai { '-m', 'space', '--create' }
  hs.timer.usleep(500000)
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
  yabai { '-m', 'window', '--resize', 'top:0:-20' }
end)
hs.hotkey.bind({ 'alt', 'ctrl', 'shift' }, 'J', function()
  yabai { '-m', 'window', '--resize', 'top:0:20' }
end)
