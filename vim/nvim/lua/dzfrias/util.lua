local M = {}

function M.get_project_root()
  return vim.fn.fnamemodify(vim.fn.finddir('.git', '.;'), ':h:p')
end

function M.nnoremap(shortcut, command)
  vim.keymap.set('n', shortcut, command, { noremap = true })
end

function M.inoremap(shortcut, command)
  vim.keymap.set('i', shortcut, command, { noremap = true })
end

function M.noremap(shortcut, command)
  vim.keymap.set('', shortcut, command, { noremap = true })
end

function M.xnoremap(shortcut, command)
  vim.keymap.set('x', shortcut, command, { noremap = true })
end

function M.bufnoremap(mode, key, cmd, opts)
  opts = opts or {}
  opts.noremap = true
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, opts)
end

function M.reload_config()
  for name, _ in pairs(package.loaded) do
    if name:find 'dzfrias' then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

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

  return nil
end

local function find_main_py(proj_root)
  local target = vim.fn.findfile('main.py', proj_root .. '/**', -1)
  if #target == 1 then
    return target[1]
  end
  return nil
end

function M.main_supported(ft)
  local supported = { 'go', 'python' }
  return vim.tbl_contains(supported, ft)
end

function M.get_main(filetype)
  local fn = nil
  if filetype == 'go' then
    fn = find_main_go
  elseif filetype == 'python' then
    fn = find_main_py
  else
    return 'Invalid filetype'
  end

  local cur_file = vim.fn.expand '%'

  local proj_root = M.get_project_root()
  if proj_root == '.' then
    return cur_file
  end
  local target = fn(proj_root)
  if target ~= nil then
    return target
  end

  return cur_file
end

return M
