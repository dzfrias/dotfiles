local M = {}

M.opts = function()
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
end

M.cmdline_config = function()
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
end

M.luasnip_keys = {
  {
    '<C-j>',
    function()
      local luasnip = require 'luasnip'
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end,
    mode = 'i',
    silent = true,
  },
  {
    '<C-k>',
    function()
      require('luasnip').jump(-1)
    end,
    mode = { 'i', 's' },
    silent = true,
  },
  {
    '<C-j>',
    function()
      require('luasnip').jump(1)
    end,
    mode = { 's' },
    silent = true,
  },
}

return M
