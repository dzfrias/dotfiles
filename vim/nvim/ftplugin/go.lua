local bufnoremap = require('util').bufnoremap


vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'

-- vim-go
bufnoremap('n', '<leader>r', '<Cmd>w<CR><Cmd>GoRun<CR>')
bufnoremap('n', '<leader>t', '<Cmd>w<CR><Cmd>GoTest<CR>')
bufnoremap('n', '<C-p>',     '<Plug>(go-doc)')
bufnoremap('n', '<leader>c', '<Plug>(go-coverage-toggle)')
bufnoremap('n', '<C-i>',     '<Cmd>GoIfErr<CR>k')
bufnoremap('i', '<C-i>',     '<Esc><Cmd>GoIfErr<CR>k')

-- Gojson
bufnoremap('n', '<leader>g',  '<Plug>Gojson')
bufnoremap('n', '<leader>gg', '<Plug>Gojsonline')
bufnoremap('x', '<leader>g',  '<Plug>Gojson')
