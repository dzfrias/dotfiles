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

vim.api.nvim_create_user_command('Cpd', function(_)
  dir = vim.fn.expand '%:h'
  vim.api.nvim_command('cd ' .. dir)
end, {})

vim.api.nvim_create_user_command(
  'TODO',
  'TodoTrouble cwd=' .. require('util').get_project_root(),
  {}
)
