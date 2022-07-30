-- Unmaps <CR> for current buffer
vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<CR>', { noremap = true })
