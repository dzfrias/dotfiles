require('plugins/plugins')
require('plugins/settings')
require('settings')
require('mappings')
require('commands')

vim.g.tokyonight_style = 'night'
vim.api.nvim_command('colorscheme tokyonight')
