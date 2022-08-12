local M = {}

function M.get_args()
  local s = vim.fn.input 'Enter CLI args: '
  return vim.fn.split(s, ' ')
end

return M
