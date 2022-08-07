local M = {}

function M.get_project_root()
  return vim.fn.fnamemodify(vim.fn.finddir('.git', '.;'), ':h:p')
end

function M.nnoremap(shortcut, command)
  vim.api.nvim_set_keymap('n', shortcut, command, { noremap = true })
end

function M.inoremap(shortcut, command)
  vim.api.nvim_set_keymap('i', shortcut, command, { noremap = true })
end

function M.noremap(shortcut, command)
  vim.api.nvim_set_keymap('', shortcut, command, { noremap = true })
end

function M.xnoremap(shortcut, command)
  vim.api.nvim_set_keymap('x', shortcut, command, { noremap = true })
end

function M.bufnoremap(mode, key, cmd)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true })
end

return M
