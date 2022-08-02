local function bufmap(mode, key, cmd)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true })
end


-- Soft wrap text at the width of the screen
vim.opt_local.textwidth = 0
vim.opt_local.wrapmargin = 0
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

vim.opt_local.spell = true

-- Horizontal traversal
bufmap('', '+', '30l')
bufmap('', '-', '30h')

bufmap('n', '<leader>t', '<Cmd>setlocal filetype=help<CR>')
