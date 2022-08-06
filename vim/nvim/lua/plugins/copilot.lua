local copilot = {
  python = true,
  zsh = true,
  zshrc = true,
  sh = true,
  bash = true,
  html = true,
  lua = true,
  css = true,
  js = true,
  json = true,
  vim = true,
  vimrc = true,
  applescript = true,
}
copilot['*'] = false

vim.g.copilot_filetypes = copilot
