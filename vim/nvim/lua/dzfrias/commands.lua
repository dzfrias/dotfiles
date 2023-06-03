vim.api.nvim_create_user_command('T', function()
  vim.api.nvim_command 'vsplit | terminal'
end, {})

vim.api.nvim_create_user_command('HT', function()
  vim.api.nvim_command 'split | terminal'
end, {})
