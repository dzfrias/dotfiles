local M = {}

local config = {
  blacklist = {},
}

Watcher = hs.application.watcher.new(function(name, event, app)
  if
    event ~= hs.application.watcher.launched
    or hs.fnutils.contains(config.blacklist, name)
  then
    return
  end

  local window = app:focusedWindow()
  if not window then
    return
  end
  window:maximize(0)
end)

--- Blacklist certain applications, by app name.
--- @param apps string[]
function M.blacklist(apps)
  config.blacklist = apps
end

--- Start the app resizer.
function M.start()
  Watcher:start()
end

return M
