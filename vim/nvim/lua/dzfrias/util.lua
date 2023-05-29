local M = {}

---@return string
function M.get_project_root()
  return vim.fn.fnamemodify(vim.fn.finddir('.git', '.;'), ':h:p')
end

---@param shortcut string
---@param command string|function
function M.nnoremap(shortcut, command, desc)
  vim.keymap.set('n', shortcut, command, { noremap = true, desc = desc })
end

---@param shortcut string
---@param command string|function
function M.inoremap(shortcut, command, desc)
  vim.keymap.set('i', shortcut, command, { noremap = true, desc = desc })
end

---@param shortcut string
---@param command string|function
function M.noremap(shortcut, command, desc)
  vim.keymap.set('', shortcut, command, { noremap = true, desc = desc })
end

---@param shortcut string
---@param command string|function
function M.xnoremap(shortcut, command, desc)
  vim.keymap.set('x', shortcut, command, { noremap = true, desc = desc })
end

---@param mode string
---@param key string
---@param cmd string|function
---@param opts? table
function M.bufnoremap(mode, key, cmd, opts)
  opts = opts or {}
  opts.buffer = true
  vim.keymap.set(mode, key, cmd, opts)
end

return M
