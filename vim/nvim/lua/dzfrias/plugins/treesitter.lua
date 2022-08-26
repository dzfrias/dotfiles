require('nvim-treesitter.configs').setup {
  ensure_installed = { 'python', 'vim', 'go', 'lua', 'json', 'regex' },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@call.outer',
        ['ic'] = '@call.inner',
      },
    },

    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']]'] = '@function.outer',
      },
      goto_previous_start = {
        ['[['] = '@function.outer',
      },
    },
  },
}
