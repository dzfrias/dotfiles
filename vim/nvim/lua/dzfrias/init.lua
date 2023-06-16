require 'dzfrias.settings'
require('lazy').setup {
  spec = {
    { import = 'dzfrias/plugins' },
  },

  install = {
    colorscheme = { 'tokyonight' },
  },

  change_detection = {
    notify = false,
  },

  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}
require 'dzfrias.commands'
require 'dzfrias.keymaps'
