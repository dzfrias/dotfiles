require 'dzfrias/settings'
require 'dzfrias/keymaps'
require 'dzfrias/commands'
require 'dzfrias/plugins'

vim.g.vimwiki_list = {
  {
    path = '~/vimwiki/school/classes/notes/math/',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/vimwiki/',
  },
}
-- These need to be set before plugins are loaded
vim.g.vimwiki_map_prefix = '<leader>v'
vim.cmd 'colorscheme tokyonight-night'
