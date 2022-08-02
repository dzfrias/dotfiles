require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'pyright', 'gopls', 'vim-language-server', 'ltex' }
}
