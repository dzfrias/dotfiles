local M = {}

function M.current_url()
  local _, url = hs.osascript.applescript [[
  tell application "Google Chrome"
    -- Get current url of active tab
    set currentUrl to get URL of active tab of first window
  end tell

  return currentUrl
  ]]
  return url
end

function M.site_wf(site_domain, keybinds)
  local wf = hs.window.filter
    .new(false)
    :setAppFilter('Google Chrome')
    :subscribe({ hs.window.filter.windowTitleChanged }, function()
      if not M.current_url():find(site_domain) then
        for _, keybind in ipairs(keybinds) do
          keybind:disable()
        end
        return
      end
      for _, keybind in ipairs(keybinds) do
        keybind:enable()
      end
    end)
  return wf
end

return M
