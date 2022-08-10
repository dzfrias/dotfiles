require('dapui').setup()
require('nvim-dap-virtual-text').setup()
require('telescope').load_extension 'dap'

require 'dzfrias/plugins/dap/daps'
require 'dzfrias/plugins/dap/mappings'

local dap = require 'dap'

local dapui = require 'dapui'
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

vim.api.nvim_set_hl(0, 'Breakpoint', { fg = '#ff9e64' })
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'Breakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'Breakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'Breakpoint', linehl = '', numhl = '' })
