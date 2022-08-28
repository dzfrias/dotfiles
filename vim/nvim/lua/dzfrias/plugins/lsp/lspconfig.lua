-- Key bindings
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<s-k>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, bufopts)
end

-- Format on save
local format = vim.api.nvim_create_augroup('format', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = format,
  pattern = '*',
  command = 'lua vim.lsp.buf.formatting()',
})

-- Setting up servers
local lspconfig = require 'lspconfig'
local servers = require('dzfrias/plugins/lsp/servers').default
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

lspconfig.ltex.setup {
  on_attach = on_attach,
  filetypes = { 'bib', 'markdown', 'org', 'plaintex', 'rst', 'rnoweb', 'tex' },
}

lspconfig.sumneko_lua.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- Do not format code
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim', 'hs' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
