local function bufmap(mode, key, cmd)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true })
end


bufmap('n', '<CR>',      '<C-J>')
bufmap('n', '<BS>',      '<C-T>')
bufmap('n', '<leader>t', '<Cmd>setlocal filetype=text<CR>')
