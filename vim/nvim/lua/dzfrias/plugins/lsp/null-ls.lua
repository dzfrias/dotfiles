local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    -- Use black python formatter
    null_ls.builtins.formatting.black,
    -- Basic zsh linting
    null_ls.builtins.diagnostics.zsh,
    -- Lua autoformatting
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.prettier,
  },
}
