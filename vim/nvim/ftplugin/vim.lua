local autopairs = {}
autopairs['('] = ')'
autopairs['['] = ']'
autopairs['{'] = '}'
autopairs["'"] = "'"
autopairs['`'] = '`'
vim.b.AutoPairs = autopairs

vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
