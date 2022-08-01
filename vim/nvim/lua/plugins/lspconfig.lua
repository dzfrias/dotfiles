-- Key bindings
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<C-p>', vim.lsp.buf.hover, bufopts)
end

-- Format on save
local format = vim.api.nvim_create_augroup('format', {})
vim.api.nvim_create_autocmd(
'BufWritePre',
{
  group = format,
  pattern = '*',
  command = 'lua vim.lsp.buf.formatting()'
}
)

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')

-- Set up language servers
local servers = { 'pyright', 'gopls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
