local bufnoremap = require('dzfrias/util').bufnoremap

-- Soft wrap text at the width of the screen
vim.opt_local.textwidth = 0
vim.opt_local.wrapmargin = 0
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

bufnoremap('n', '<leader>t', '<Cmd>setlocal filetype=help<CR>')
