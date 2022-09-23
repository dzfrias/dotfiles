local M = {}

--- Returns the current Arc tabs's url.
---@return string
function M.current_url()
  local _, url = hs.osascript.applescript [[
  tell application "Arc"
    -- Get current url of active tab
    set currentUrl to get URL of active tab of first window
  end tell

  return currentUrl
  ]]
  return url
end

--- Makes a window filter for a given website
---@param site_domain string
function M.site_wf(site_domain, keybinds)
  local wf = hs.window.filter
    .new(false)
    :allowApp('Arc')
    :subscribe(
      { hs.window.filter.windowTitleChanged, hs.window.filter.windowFocused },
      function()
        if not M.current_url():find(site_domain) then
          for _, keybind in ipairs(keybinds) do
            keybind:disable()
          end
          return
        end
        for _, keybind in ipairs(keybinds) do
          keybind:enable()
        end
      end
    )
    :subscribe({ hs.window.filter.windowUnfocused }, function()
      for _, keybind in ipairs(keybinds) do
        keybind:disable()
      end
    end)
  return wf
end

return M
