-- Key bindings
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<C-p>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, bufopts)
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

-- Setting up servers
local lspconfig = require('lspconfig')
local servers = require('plugins/lsp/servers').default
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

lspconfig.ltex.setup {
  on_attach = on_attach,
  filetypes = { 'bib', 'markdown', 'org', 'plaintex', 'rst', 'rnoweb', 'tex' }
}
