local servers = require 'dzfrias/plugins/lsp/servers'
local defaults = servers.default

local all = {}
for _, server in ipairs(servers.special) do
  table.insert(all, server)
end
for _, server in ipairs(servers.default) do
  table.insert(all, server)
end

require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = all,
}
