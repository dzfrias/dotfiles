local M = {}

local function get_args()
  local s = vim.fn.input('Enter CLI args: ')
  return vim.fn.split(s, ' ')
end

local function get_project_root(dir)
  dir = vim.fn.fnamemodify(dir, ':p'):sub(1, -2)
  home = os.getenv('HOME')

  if dir == home then
    return '.'
  end
  if vim.fn.isdirectory(dir .. '/.git') == 1 then
    return dir
  end

  pdir = vim.fn.fnamemodify(dir, ':h')
  return get_project_root(pdir)
end

function M.add_args_go()
  local proj_root = get_project_root('.')
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
