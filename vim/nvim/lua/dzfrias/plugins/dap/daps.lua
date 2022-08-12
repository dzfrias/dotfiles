local dap = require 'dap'

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  },
}

local cli = require 'dzfrias/plugins/dap/cli'
local util = require 'dzfrias/util'
dap.configurations.go = {
  {
    type = 'delve',
    name = 'Package',
    request = 'launch',
    program = '${file}',
  },
  {
    type = 'delve',
    name = 'Test',
    request = 'launch',
    mode = 'test',
    program = './${relativeFileDirname}',
  },
  {
    type = 'delve',
    name = 'CLI',
    request = 'launch',
    program = function()
      return util.get_main 'go'
    end,
    args = cli.get_args,
  },
}
