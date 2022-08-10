require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    changedelete = { hl = 'GitSignsDelete' },
  },
}
