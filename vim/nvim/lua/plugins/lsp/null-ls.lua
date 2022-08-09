null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    -- Use autopep8 python formatter
    null_ls.builtins.formatting.autopep8,
    -- Basic zsh linting
    null_ls.builtins.diagnostics.zsh,
    -- -- Lua autoformatting
    -- null_ls.builtins.formatting.stylua,
  },
}
