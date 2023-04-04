return function()
  local rt = require 'rust-tools'
  local data = vim.fn.stdpath 'data'
  -- Path to liblldb, installed with Mason
  local liblldb = data
    .. '/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib'
  -- Path to codelldb, installed with Mason
  local codelldb = data .. '/mason/packages/codelldb/extension/adapter/codelldb'
  return {
    server = {
      on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, bufopts)

        vim.keymap.set('n', '<s-k>', rt.hover_actions.hover_actions, bufopts)
        vim.keymap.set(
          'n',
          '<leader>a',
          rt.code_action_group.code_action_group,
          bufopts
        )
      end,

      settings = {
        ['rust-analyzer'] = {
          files = {
            excludeDirs = { 'website', 'dist' },
          },
        },
      },
    },

    dap = {
      -- Setup for codelldb
      adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb,
        liblldb
      ),
    },
  }
end
