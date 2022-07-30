local function bufmap(mode, key, cmd)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true })
end

bufmap('i', '<C-v>', '<Plug>(emmet-expand-abbr)')
bufmap('n', '<C-v>', '<Plug>(emmet-expand-abbr)')
