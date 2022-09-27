local bufnoremap = require('dzfrias/util').bufnoremap

vim.opt_local.colorcolumn = '100'
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'

bufnoremap('n', '<leader>dd', '<Cmd>RustDebuggables<CR>')

local autopairs = {}
autopairs['('] = ')'
autopairs['['] = ']'
autopairs['{'] = '}'
autopairs['"'] = '"'
autopairs['`'] = '`'
autopairs['<'] = '>'
vim.b.AutoPairs = autopairs
