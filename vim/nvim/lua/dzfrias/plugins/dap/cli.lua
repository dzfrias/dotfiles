local M = {}

function M.get_args()
  local s = vim.fn.input 'Enter CLI args: '
  return vim.fn.split(s, ' ')
end

local function find_main_go(proj_root, strategy)
  if strategy == 'cmd' then
    local proj_name = vim.fn.fnamemodify(proj_root, ':t')
    local target = proj_root .. '/cmd/' .. proj_name .. '/main.go'
    return { target }
  elseif strategy == 'root' then
    local target = proj_root .. '/main.go'
    return { target }
  elseif strategy == 'cmdfind' then
    local target = vim.fn.findfile('main.go', proj_root .. '/cmd/*', -1)
    return target
  elseif strategy == 'find' then
    local target = vim.fn.findfile('main.go', proj_root .. '/**', -1)
    return target
  end
end

function M.get_main_go()
  local proj_root = require('dzfrias/util').get_project_root()
  for _, strategy in ipairs { 'cmd', 'root', 'cmdfind', 'find' } do
    local target = find_main_go(proj_root, strategy)
    -- Check if main.go was found
    if #target == 1 and vim.fn.filereadable(target[1]) == 1 then
      return target[1]
    end
  end

  return nil
end

return M
