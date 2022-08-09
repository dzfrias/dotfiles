local u = require('util')

-- Previous tab
local tabp = hs.hotkey.new({ 'ctrl' }, 'J', function()
  u.keyStroke({ 'cmd', 'alt' }, 'Left')
end)

-- Next tab
local tabn = hs.hotkey.new({ 'ctrl' }, 'K', function()
  u.keyStroke({ 'cmd', 'alt' }, 'Right')
end)

-- Copy current tab's url to clipboard
local copy_url = hs.hotkey.new({ 'ctrl' }, 'Y', function()
  hs.osascript.applescript([[
  tell application "Google Chrome"
    -- Get current url of active tab
    set currentUrl to get URL of active tab of first window
  end tell

  -- Copy current url to clipboard
  set the clipboard to currentUrl
  ]])
end)

-- Fuzzy find bookmarks
local bookmarks = hs.hotkey.new({ 'ctrl' }, 'B', function()
  local chrome = hs.application.get('Google Chrome')
  local items = chrome:getMenuItems()
  local bookmark_menu = items[6].AXChildren[1]

  local bookmarks = {}
  for i, item in ipairs(bookmark_menu) do
    if i > 4 then
      if item.AXChildren then
        for _, child in ipairs(item.AXChildren[1]) do
          local choice = { text = child.AXTitle }
          table.insert(bookmarks, choice)
        end
      else
        local choice = { text = item.AXTitle }
        table.insert(bookmarks, choice)
      end
    end
  end

  local chooser = hs.chooser.new(function(choice)
    chrome:activate()
    chrome:selectMenuItem('New Tab')
    chrome:selectMenuItem(choice.text)
  end)
  chooser:choices(bookmarks)
  chooser:show()
end)

-- Fuzzy find tabs
local tabs = hs.hotkey.new({ 'ctrl' }, 'T', function()
  u.keyStroke({ 'cmd', 'shift' }, 'A')
end)

-- Go up
local up = hs.hotkey.new({ 'ctrl', 'shift' }, 'K', function()
  u.keyStroke('Up')
end)

-- Go down
local down = hs.hotkey.new({ 'ctrl', 'shift' }, 'J', function()
  u.keyStroke('Down')
end)

local keybinds = {
  tabp,
  tabn,
  bookmarks,
  up,
  down,
  tabs,
  copy_url,
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
