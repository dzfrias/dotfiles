local function bufmap(mode, key, cmd)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true })
end


vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.colorcolumn = '79'
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'

-- Correct some spelling
vim.cmd([[
iabbrev <buffer> slef self
iabbrev <buffer> sefl self
]])

vim.cmd([[
" Put pprint at the top of the file
command! -buffer Pprint normal! mpggOfrom pprint import pprint<Esc>`pdmp
" Delete first line in a file
command! -buffer Dprint normal! mpggdd`pdmp
]])
