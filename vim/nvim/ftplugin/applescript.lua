vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

vim.opt_local.commentstring = '--%s'

vim.b.callcmd = 'osascript ' .. vim.fn.expand('%')
