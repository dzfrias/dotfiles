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
    program = cli.get_main_go,
    args = cli.get_args,
  },
}
