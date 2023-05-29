return {
  -- Tree sitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      ensure_installed = {
        'python',
        'vim',
        'go',
        'lua',
        'json',
        'regex',
        'rust',
        'query',
        'toml',
        'markdown',
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
      },

      autotag = {
        enable = true,
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
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
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
    build = ':TSUpdate',
  },

  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
