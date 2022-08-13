require('nvim-treesitter.configs').setup {
  ensure_installed = { 'python', 'vim', 'go', 'lua', 'json', 'regex' },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
