null_ls = require('null-ls')
null_ls.setup({
  sources = {
    -- Use autopep8 python formatter
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.diagnostics.zsh
  },
})
