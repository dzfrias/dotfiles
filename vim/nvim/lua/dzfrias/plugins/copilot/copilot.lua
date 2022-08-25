local filetypes = require 'dzfrias/plugins/copilot/filetypes'

local copilot = {}
for _, ft in ipairs(filetypes) do
  copilot[ft] = true
end
copilot['*'] = false

vim.g.copilot_filetypes = copilot
