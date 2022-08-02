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
local servers = { 'pyright', 'gopls', 'vimls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

-- lua setup
require 'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
