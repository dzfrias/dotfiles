local u = require 'dzfrias/util'

-- Reload config
vim.api.nvim_create_user_command('Reload', u.reload_config, {})

vim.api.nvim_create_user_command('T', function()
  vim.api.nvim_command 'vsplit | terminal'
end, {})

vim.api.nvim_create_user_command('HT', function()
  vim.api.nvim_command 'split | terminal'
end, {})

vim.g.loaded_netrwPlugin = 1
vim.cmd [[
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
]]
