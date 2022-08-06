local M = {}

local function get_args()
  local s = vim.fn.input('Enter CLI args: ')
  return vim.fn.split(s, ' ')
end

function M.add_args_go()
  local proj_root = require('util').get_project_root()
  local proj_name = vim.fn.fnamemodify(proj_root, ':t')
  local target = proj_root .. '/cmd/' .. proj_name .. '/main.go'

  local conf = {
    type = 'delve',
    name = 'CLI',
    request = 'launch',
    program = target,
    args = get_args()
  }

  return conf
end

return M
