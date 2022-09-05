require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = {
    'codelldb',
    'gopls',
    'json-lsp',
    'ltex-ls',
    'lua-language-server',
    'pyright',
    'rust-analyzer',
    'shellcheck',
    'stylua',
    'vim-language-server',
  },
}
