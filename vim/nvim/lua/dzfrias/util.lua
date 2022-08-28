local M = {}

---@return string
function M.get_project_root()
  return vim.fn.fnamemodify(vim.fn.finddir('.git', '.;'), ':h:p')
end

---@param shortcut string
---@param command string|function
function M.nnoremap(shortcut, command)
  vim.keymap.set('n', shortcut, command, { noremap = true })
end

---@param shortcut string
---@param command string|function
function M.inoremap(shortcut, command)
  vim.keymap.set('i', shortcut, command, { noremap = true })
end

---@param shortcut string
---@param command string|function
function M.noremap(shortcut, command)
  vim.keymap.set('', shortcut, command, { noremap = true })
end

---@param shortcut string
---@param command string|function
function M.xnoremap(shortcut, command)
  vim.keymap.set('x', shortcut, command, { noremap = true })
end

---@param mode string
---@param key string
---@param cmd string|function
---@param opts? table
function M.bufnoremap(mode, key, cmd, opts)
  opts = opts or {}
  opts.noremap = true
  opts.buffer = true
  vim.keymap.set(mode, key, cmd, opts)
end

function M.reload_config()
  for name, _ in pairs(package.loaded) do
    if name:find 'dzfrias' then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

---@param proj_root string
local function find_main_go(proj_root)
  local target = nil
  local proj_name = vim.fn.fnamemodify(proj_root, ':t')

  target = proj_root .. '/cmd/' .. proj_name .. '/main.go'
  if vim.fn.filereadable(target) == 1 then
    return target
  end
  target = proj_root .. '/main.go'
  if vim.fn.filereadable(target) == 1 then
    return target
  end
  target = vim.fn.findfile('main.go', proj_root .. '/cmd/*', -1)
  if #target == 1 then
    return target[1]
  end
  target = vim.fn.findfile('main.go', proj_root .. '/**', -1)
  if #target == 1 then
    return target[1]
  end

  return vim.fn.expand '%'
end

local function find_main_py(proj_root)
  local target = vim.fn.findfile('main.py', proj_root .. '/**', -1)
  if target[1] then
    return target[1]
  end
  return vim.fn.expand '%'
end

M.run_cmds = {
  zsh = { 'zsh' },
  markdown = { 'cat' },
  text = { 'cat' },
  applescript = { 'osascript' },
  go = { 'go', 'run' },
  python = { 'python3' },
}

M.run_cmds_no_main = {
  rust = { 'cargo', 'run' },
}

function M.main_supported(ft)
  return M.run_cmds[ft] ~= nil or M.run_cmds_no_main[ft] ~= nil
end

function M.get_main(filetype)
  local fn = nil
  if filetype == 'go' then
    fn = find_main_go
  elseif filetype == 'python' then
    fn = find_main_py
  elseif M.run_cmds[filetype] then
    return vim.fn.expand '%'
  else
    return 'Invalid filetype'
  end

  local proj_root = M.get_project_root()
  if proj_root == '.' then
    return vim.fn.expand '%'
  end

  return fn(proj_root)
end

return M
