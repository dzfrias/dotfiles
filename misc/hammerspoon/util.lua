local M = {}

-- key_stroke types a keystroke with no delay, and optionally accepts modifiers
function M.key_stroke(mods_or_key, key)
  if type(mods_or_key) == 'string' then
    return hs.eventtap.keyStroke({}, mods_or_key, 0)
  end
  return hs.eventtap.keyStroke(mods_or_key, key, 0)
end

-- app_wf configures hotkeys for a specific application
function M.app_wf(app_name, keybinds)
  local wf = hs.window.filter.new(app_name)
  wf
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
  return wf
end

return M
