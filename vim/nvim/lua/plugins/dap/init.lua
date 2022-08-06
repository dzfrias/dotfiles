require('dap-go').setup()
require('dapui').setup()
require("nvim-dap-virtual-text").setup()

require('plugins/dap/daps')
require('plugins/dap/mappings')

local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
