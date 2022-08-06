-- Fold all if line number is greater than 300
local bufread = vim.api.nvim_create_augroup('bufread', {})
vim.api.nvim_create_autocmd(
  'BufRead',
  {
    group = bufread,
    pattern = '*',
    callback = function()
      if vim.fn.line('$') > 300 then
        vim.api.nvim_command('normal! zM')
      end
    end
  }
)

util = require('util')
-- ProjFiles is a command that finds files at the project root
vim.api.nvim_create_user_command(
  'ProjFiles',
  'Telescope find_files cwd=' .. util.get_project_root(),
  {}
)

-- ProjLines is a command that finds lines at the project root
vim.api.nvim_create_user_command(
  'ProjLines',
  'Telescope live_grep cwd=' .. util.get_project_root(),
  {}
)

-- Cpd goes to the directory of the current file
vim.api.nvim_create_user_command(
  'Cpd',
  function(_)
    dir = vim.fn.expand('%:h')
    vim.api.nvim_command('cd ' .. dir)
  end,
  {}
)

-- FF calls find_files, accepting an argument for the directory to search
vim.api.nvim_create_user_command(
  'FF',
  function(opts)
    vim.cmd('Telescope find_files cwd=' .. opts.args)
  end,
  {
    nargs = 1
  }
)
