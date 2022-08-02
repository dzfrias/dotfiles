require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = require('plugins/lsp/servers')
}
