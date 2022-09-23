local filetypes = require 'dzfrias/plugins/copilot/filetypes'

local copilot = {}
for _, ft in ipairs(filetypes) do
  copilot[ft] = true
end
copilot['*'] = false

vim.g.copilot_filetypes = copilot
-- Set node binary to older version
vim.g.copilot_node_command = '~/.old_node/lib/node_modules/node/bin/node'
