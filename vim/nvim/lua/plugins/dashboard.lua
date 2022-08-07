local db = require 'dashboard'

db.custom_center = {
  {
    icon = '  ',
    desc = 'Find File                              ',
    action = function()
      if require('util').get_project_root() == '' then
        require('telescope.builtin').find_files()
      else
        vim.cmd 'ProjFiles'
      end
    end,
  },
  {
    icon = '  ',
    desc = 'Empty buffer                           ',
    action = 'DashboardNewFile',
  },
  {
    icon = '  ',
    desc = 'Packer Install                         ',
    action = 'PackerInstall',
  },
  {
    icon = '  ',
    desc = 'Git                                    ',
    action = 'Git | wincmd o',
  },
}
