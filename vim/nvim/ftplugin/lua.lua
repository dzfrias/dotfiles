print(vim.fn.expand('%'))
if vim.fn.expand('%'):find('plugins.lua') then
  vim.cmd('normal! zM')
end