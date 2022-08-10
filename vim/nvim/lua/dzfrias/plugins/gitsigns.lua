require('gitsigns').setup {
  attach_to_untracked = false,
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    changedelete = { hl = 'GitSignsDelete' },
  },
}
