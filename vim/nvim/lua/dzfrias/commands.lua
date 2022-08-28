local u = require 'dzfrias/util'

-- Fold all if line number is greater than 300
local bufread = vim.api.nvim_create_augroup('bufread', {})
vim.api.nvim_create_autocmd('BufRead', {
  group = bufread,
  pattern = '*',
  callback = function()
    if vim.fn.line '$' > 300 then
      vim.api.nvim_command 'normal! zM'
    end
  end,
})

-- Go to directory of current file
vim.api.nvim_create_user_command('Cpd', function(_)
  local dir = vim.fn.expand '%:h'
  vim.api.nvim_command('cd ' .. dir)
end, {})

-- Reload config
vim.api.nvim_create_user_command('Reload', u.reload_config, {})

vim.g.loaded_netrwPlugin = 1
vim.cmd [[
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
]]
