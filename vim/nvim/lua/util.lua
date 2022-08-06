local M = {}

local function get_project_root(dir)
  dir = vim.fn.fnamemodify(dir, ':p'):sub(1, -2)
  home = os.getenv('HOME')

  if dir == home then
    return '.'
  end
  if vim.fn.isdirectory(dir .. '/.git') == 1 then
    return dir
  end

  pdir = vim.fn.fnamemodify(dir, ':h')
  return get_project_root(pdir)
end

function M.get_project_root()
  return get_project_root('.')
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

return M
