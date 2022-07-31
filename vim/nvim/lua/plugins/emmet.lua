vim.g.user_emmet_install_global = 0
local emmet = vim.api.nvim_create_augroup('emmet', {})
vim.api.nvim_create_autocmd(
  'BufEnter',
  {
    group = emmet,
    pattern = {'*.html', '*.css'},
    command = 'EmmetInstall'
  }
)
