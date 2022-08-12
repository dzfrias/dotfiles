local util = require 'dzfrias/util'

return {
  name = 'run noargs',
  builder = function()
    local ft = vim.o.filetype
    local main = util.get_main(ft)
    return {
      cmd = util.run_cmds[ft],
      args = { main },
    }
  end,
  condition = {
    callback = function()
      return util.main_supported(vim.o.filetype)
    end,
  },
}
