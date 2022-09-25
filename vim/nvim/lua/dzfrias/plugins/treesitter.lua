require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'python',
    'vim',
    'go',
    'lua',
    'json',
    'regex',
    'rust',
    'query',
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'markdown' },
  },

  playground = {
    enable = true,
  },

  autotag = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@call.outer',
        ['ic'] = '@call.inner',
        ['ia'] = '@argument',
      },
    },

    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']]'] = '@function.outer',
        [')'] = '@argument',
      },
      goto_previous_start = {
        ['[['] = '@function.outer',
        ['('] = '@argument',
      },
    },
  },
}
