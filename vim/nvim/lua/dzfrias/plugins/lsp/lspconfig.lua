local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

-- Key bindings
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<s-k>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
end

-- Format on save
local format = vim.api.nvim_create_augroup('format', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = format,
  pattern = '*',
  command = 'lua vim.lsp.buf.format { async = true }',
})

-- Setup lspconfig capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setting up servers
local lspconfig = require 'lspconfig'
local default_install = { 'pyright', 'gopls', 'cssls', 'svelte' }
for _, lsp in ipairs(default_install) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
      },
    },
  },
}

lspconfig.sumneko_lua.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- Do not format code
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = capabilities,
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
