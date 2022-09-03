local telescope = require 'telescope'

local actions = require 'telescope.actions'
telescope.setup {
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
        ['<Esc>'] = actions.close,
      },
    },
  },
}

-- Load fuzzy finder
telescope.load_extension 'fzf'
telescope.load_extension 'project'
