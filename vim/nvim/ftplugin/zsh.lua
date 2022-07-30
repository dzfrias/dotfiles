vim.api.nvim_command('iabbrev <buffer> #! /usr/local/bin/zsh')

vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

vim.b.callcmd = 'zsh ' .. vim.fn.expand('%')
