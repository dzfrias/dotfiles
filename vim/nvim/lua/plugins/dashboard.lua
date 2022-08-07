local db = require 'dashboard'

db.custom_center = {
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
