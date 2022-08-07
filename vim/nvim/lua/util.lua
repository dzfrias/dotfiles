local M = {}

function M.get_project_root()
  return vim.fn.fnamemodify(vim.fn.finddir('.git', '.;'), ':h:p')
end

function M.nnoremap(shortcut, command)
  vim.keymap.set('n', shortcut, command, { noremap = true })
end

function M.inoremap(shortcut, command)
  vim.keymap.set('i', shortcut, command, { noremap = true })
end

function M.noremap(shortcut, command)
  vim.keymap.set('', shortcut, command, { noremap = true })
end

function M.xnoremap(shortcut, command)
  vim.keymap.set('x', shortcut, command, { noremap = true })
end

function M.bufnoremap(mode, key, cmd)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true })
end

return M
