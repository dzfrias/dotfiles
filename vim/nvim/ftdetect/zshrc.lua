-- Fold all if line number is greater than 300
local zshrc = vim.api.nvim_create_augroup('zshrc', {})
vim.api.nvim_create_autocmd(
  'BufEnter',
  {
    group = zshrc,
    pattern = { '.zshrc', 'zshrc' },
    command = 'setlocal filetype=zshrc.zsh syntax=zsh'
  }
)
