return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        keys = {
          {
            '<C-k>',
            function()
              require('luasnip').jump(-1)
            end,
            mode = { 'i', 's' },
            desc = 'previous luasnip item',
            silent = true,
          },
          {
            '<C-j>',
            function()
              require('luasnip').jump(1)
            end,
            mode = { 'i', 's' },
            desc = 'next luasnip item',
            silent = true,
          },
        },
        dependencies = {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load {
            paths = { '~/.dotfiles/vim/nvim/snippets' },
          }
        end,
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      {
        'hrsh7th/cmp-cmdline',
        config = function()
          local cmp = require 'cmp'
          cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' },
            },
          })

          cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'path' },
            }, {
              { name = 'cmdline' },
            }),
          })
        end,
      },
    },
    opts = function()
      -- Setup nvim-cmp.
      local cmp = require 'cmp'

      return {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        }),
      }
    end,
  },
}
