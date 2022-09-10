local bufnoremap = require('dzfrias/util').bufnoremap

-- Soft wrap text at the width of the screen
vim.opt_local.textwidth = 0
vim.opt_local.wrapmargin = 0
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

vim.opt_local.spell = true

-- Horizontal traversal
bufnoremap('', '+', '30l')
bufnoremap('', '-', '30h')

bufnoremap('n', '<leader>t', '<Cmd>setlocal filetype=help<CR>')

-- Emmet
bufnoremap('i', '<C-e>', '<Plug>(emmet-expand-abbr)')
bufnoremap('n', '<C-e>', '<Plug>(emmet-expand-abbr)')
