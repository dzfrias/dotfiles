local M = {}

function M.keyStroke(mods_or_key, key)
  if type(mods_or_key) == 'string' then
    return hs.eventtap.keyStroke({}, mods_or_key, 0)
  end
  return hs.eventtap.keyStroke(mods_or_key, key, 0)
end

return M
