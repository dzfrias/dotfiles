local M = {}

function M.get_args()
  local s = vim.fn.input('Enter CLI args: ')
  return vim.fn.split(s, ' ')
end

function M.add_args_go()
  local proj_root = require('util').get_project_root()
  local proj_name = vim.fn.fnamemodify(proj_root, ':t')
  local target = proj_root .. '/cmd/' .. proj_name .. '/main.go'

  return target
end

return M
