local bufnoremap = require('dzfrias/util').bufnoremap

vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'

-- vim-go
bufnoremap('n', '<leader>r', '<Cmd>w<CR><Cmd>GoRun<CR>')
bufnoremap('n', '<leader>T', '<Cmd>w<CR><Cmd>GoTest<CR>')
bufnoremap('n', '<leader>c', '<Plug>(go-coverage-toggle)')
bufnoremap('n', '<C-e>', '<Cmd>GoIfErr<CR>2kA ')
bufnoremap('i', '<C-e>', '<Esc><Cmd>GoIfErr<CR>2kA ')

-- Gojson
bufnoremap('n', '<leader>g', '<Plug>Gojson')
bufnoremap('n', '<leader>gg', '<Plug>Gojsonline')
bufnoremap('x', '<leader>g', '<Plug>Gojson')
