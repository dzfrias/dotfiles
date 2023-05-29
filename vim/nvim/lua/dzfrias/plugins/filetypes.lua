return {
  -- Rust
  {
    'simrat39/rust-tools.nvim',
    ft = { 'rust', 'toml' },
    opts = function()
      local rt = require 'rust-tools'
      local data = vim.fn.stdpath 'data'
      -- Path to liblldb, installed with Mason
      local liblldb = data
        .. '/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib'
      -- Path to codelldb, installed with Mason
      local codelldb = data
        .. '/mason/packages/codelldb/extension/adapter/codelldb'
      return {
        server = {
          on_attach = function(_, bufnr)
            vim.api.nvim_buf_set_option(
              bufnr,
              'omnifunc',
              'v:lua.vim.lsp.omnifunc'
            )
            local bufopts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, bufopts)

            vim.keymap.set(
              'n',
              '<s-k>',
              rt.hover_actions.hover_actions,
              bufopts
            )
            vim.keymap.set(
              { 'n', 'v' },
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
    end,
  },

  -- Bacon rust tool integration
  {
    'Canop/nvim-bacon',
    cmd = 'BaconList',
    keys = {
      { '<leader>Bl', '<Cmd>BaconList<CR>', desc = 'Open bacon' },
      {
        '<leader>Bn',
        '<Cmd>BaconLoad<CR><Cmd>BaconNext<CR>',
        desc = 'Go to next bacon result',
      },
      {
        '<leader>Bp',
        '<Cmd>BaconLoad<CR><Cmd>BaconPrev<CR>',
        desc = 'Go to previous bacon result',
      },
    },
  },

  { 'dzfrias/scurry.vim', ft = 'scurry' },

  -- Tridactyl firefox extension
  { 'tridactyl/vim-tridactyl', ft = 'tridactyl' },

  -- Inline colors
  {
    'rrethy/vim-hexokinase',
    build = 'make hexokinase',
    ft = 'css',
  },
}
