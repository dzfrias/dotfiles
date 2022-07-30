vim.o.modeline = true
vim.o.hidden = true
vim.o.nobackup = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.writebackup = false
vim.o.cmdheight = 2
-- vim.o.shortmess = vim.o.shortmess + 'c'
vim.o.signcolumn = 'number'
vim.o.background = 'dark'
vim.o.guicursor = 'c:ver20,i:ver20,ci:ver20,cr:ver20'
vim.o.updatetime = 100
vim.o.clipboard = 'unnamed'
vim.o.modelines = 1


require('plugins')
vim.api.nvim_command('colorscheme tokyonight')
