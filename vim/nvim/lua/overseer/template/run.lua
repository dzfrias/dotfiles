local util = require 'dzfrias/util'

return {
  name = 'run',
  builder = function(task)
    local ft = vim.o.filetype
    local main = util.get_main(ft)
    return {
      cmd = util.run_cmds[ft],
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
