local function bufmap(mode, key, cmd)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true })
end


vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'

-- vim-go
bufmap('n', '<leader>r', '<Cmd>w<CR><Cmd>GoRun<CR>')
bufmap('n', '<leader>t', '<Cmd>w<CR><Cmd>GoTest<CR>')
bufmap('n', '<C-p>',     '<Plug>(go-doc)')
bufmap('n', '<leader>c', '<Plug>(go-coverage-toggle)')
bufmap('n', '<C-i>',     '<Cmd>GoIfErr<CR>k')
bufmap('i', '<C-i>',     '<Esc><Cmd>GoIfErr<CR>k')

-- Gojson
bufmap('n', '<leader>g',  '<Plug>Gojson')
bufmap('n', '<leader>gg', '<Plug>Gojsonline')
bufmap('x', '<leader>g',  '<Plug>Gojson')
