local u = require 'util'

-- Previous tab
local tabp = hs.hotkey.new({ 'ctrl' }, 'J', function()
  u.key_stroke({ 'cmd', 'alt' }, 'Left')
end)

-- Next tab
local tabn = hs.hotkey.new({ 'ctrl' }, 'K', function()
  u.key_stroke({ 'cmd', 'alt' }, 'Right')
end)

-- Copy current tab's url to clipboard
local copy_url = hs.hotkey.new({ 'ctrl' }, 'Y', function()
  hs.osascript.applescript [[
  tell application "Google Chrome"
    -- Get current url of active tab
    set currentUrl to get URL of active tab of first window
  end tell

  -- Copy current url to clipboard
  set the clipboard to currentUrl
  ]]
end)

-- Switches to next chrome profile, wraps if at end
local switch_profile = hs.hotkey.new({ 'ctrl' }, 'P', function()
  local chrome = hs.application.get 'Google Chrome'
  local profile_menu = chrome:getMenuItems()[7].AXChildren[1]
  for i, profile in ipairs(profile_menu) do
    if profile.AXMenuItemMarkChar == '' then
      goto continue
    end
    local next_profile = profile_menu[i + 1].AXTitle
    if next_profile ~= '' then
      chrome:selectMenuItem(next_profile)
    else
      chrome:selectMenuItem(profile_menu[1].AXTitle)
    end
    ::continue::
  end
end)

-- Fuzzy find bookmarks
local bookmarks = hs.hotkey.new({ 'ctrl' }, 'B', function()
  local chrome = hs.application.get 'Google Chrome'
  local items = chrome:getMenuItems()
  local bookmark_menu = items[6].AXChildren[1]

  local bookmarks = {}
  for i, item in ipairs(bookmark_menu) do
    if i < 5 then
      goto continue
    end
    if item.AXChildren then
      for _, child in ipairs(item.AXChildren[1]) do
        local choice = { text = child.AXTitle }
        table.insert(bookmarks, choice)
      end
    else
      local choice = { text = item.AXTitle }
      table.insert(bookmarks, choice)
    end
    ::continue::
  end

  local chooser = hs.chooser.new(function(choice)
    if not choice then
      return
    end
    chrome:activate()
    chrome:selectMenuItem 'New Tab'
    chrome:selectMenuItem(choice.text)
  end)
  chooser:choices(bookmarks)
  chooser:show()
end)

-- Fuzzy find tabs
local tabs = hs.hotkey.new({ 'ctrl' }, 'T', function()
  u.key_stroke({ 'cmd', 'shift' }, 'A')
end)

-- Go up
local up = hs.hotkey.new({ 'ctrl', 'shift' }, 'K', function()
  u.key_stroke 'Up'
end)

-- Go down
local down = hs.hotkey.new({ 'ctrl', 'shift' }, 'J', function()
  u.key_stroke 'Down'
end)

local keybinds = {
  tabp,
  tabn,
  bookmarks,
  up,
  down,
  tabs,
  copy_url,
  switch_profile,
}

u.app_wf('Google Chrome', keybinds)
