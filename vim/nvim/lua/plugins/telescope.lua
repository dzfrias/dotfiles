local actions = require 'telescope.actions'

local trouble = require 'trouble.providers.telescope'
require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.7 },
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-f>'] = actions.preview_scrolling_down,
        ['<C-b>'] = actions.preview_scrolling_up,
      },
    },
  },
}

-- Load fuzzy finder
require('telescope').load_extension 'fzf'
