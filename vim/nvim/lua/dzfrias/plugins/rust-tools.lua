local rt = require 'rust-tools'

rt.setup {
  server = {
    on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, bufopts)

      -- Hover actions
      vim.keymap.set('n', '<s-k>', rt.hover_actions.hover_actions, bufopts)
      -- Code action groups
      vim.keymap.set(
        'n',
        '<leader>a',
        rt.code_action_group.code_action_group,
        bufopts
      )
    end,
  },
}
