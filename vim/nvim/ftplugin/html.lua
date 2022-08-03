local function bufmap(mode, key, cmd)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true })
end


vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- For the Jinja2 template engine
bufmap('i', '{%', '{%  %}<Esc>hhi')

-- Emmet
bufmap('i', 'ee', '<Plug>(emmet-expand-abbr)')
bufmap('n', '<C-v>', '<Plug>(emmet-expand-abbr)')
