local M = {}

---key_stroke types a keystroke with no delay, and optionally accepts modifiers
---@param mods_or_key string|string[]
---@param key string?
function M.key_stroke(mods_or_key, key)
  if type(mods_or_key) == 'string' then
    return hs.eventtap.keyStroke({}, mods_or_key, 0)
  end
  return hs.eventtap.keyStroke(mods_or_key, key, 0)
end

return M
