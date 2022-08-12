local util = require 'dzfrias/util'

-- get_run_cmd gets the command to run for the given filetype
local function get_run_cmd(ft)
  if ft == 'go' then
    return { 'go', 'run' }
  elseif ft == 'python' then
    return { 'python3' }
  end
end

return {
  name = 'run',
  builder = function(task)
    local ft = vim.o.filetype
    local main = util.get_main(ft)
    return {
      cmd = get_run_cmd(ft),
      args = { main, task.args },
    }
  end,
  params = {
    args = {
      type = 'string',
      name = 'Arguments',
      description = 'Arguments for the command',
    },
  },
  condition = {
    callback = function()
      return util.main_supported(vim.o.filetype)
    end,
  },
}
