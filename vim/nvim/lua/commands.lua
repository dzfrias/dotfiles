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

-- get_project_root gets the root of the current directory (based on .git)
local function get_project_root(dir)
  -- Absolute path of directory
  dir = vim.fn.fnamemodify(dir, ':p')
  home = os.getenv('HOME')

  if dir == home or string.sub(dir, -4, -1) == home then
    return '.'
  end
  if vim.fn.isdirectory(dir .. '.git') == 1 then
    return dir
  end

  return get_project_root(dir .. '/..')
end
-- ProjFiles is a command that calls get_project_root at the current directory
vim.api.nvim_create_user_command(
  'ProjFiles',
  'Telescope find_files cwd=' .. get_project_root('.'),
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
