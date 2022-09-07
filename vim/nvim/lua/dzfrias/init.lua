require 'dzfrias/settings'
require 'dzfrias/keymaps'
require 'dzfrias/commands'
require 'dzfrias/plugins'

-- These need to be set before plugins are loaded
vim.g.vimwiki_map_prefix = '<leader>v'
vim.g.tokyonight_style = 'night'
vim.cmd 'colorscheme tokyonight'
