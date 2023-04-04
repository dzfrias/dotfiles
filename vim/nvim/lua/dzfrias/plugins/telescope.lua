local M = {}

function M.opts()
  local actions = require 'telescope.actions'

  return {
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
end

M.keys = {
  {
    '<leader>tf',
    function()
      require('telescope.builtin').find_files {
        cwd = require('dzfrias.util').get_project_root(),
      }
    end,
    desc = 'Telescope files',
  },
  {
    '<leader>tl',
    function()
      require('telescope.builtin').live_grep {
        cwd = require('dzfrias.util').get_project_root(),
      }
    end,
    desc = 'Telescope by line',
  },
  {
    '<leader>tt',
    function()
      require('telescope.builtin').lsp_document_symbols()
    end,
    desc = 'Telescope document symbols',
  },
  {
    '<leader>tr',
    function()
      require('telescope.builtin').lsp_references()
    end,
    desc = 'Telescope lsp references',
  },
  {
    '<leader>tk',
    function()
      require('telescope.builtin').keymaps()
    end,
    desc = 'Telescope keymaps',
  },
  {
    '<leader>th',
    function()
      require('telescope.builtin').help_tags()
    end,
    desc = 'Telescope help tags',
  },
  {
    '<leader>tb',
    function()
      require('telescope.builtin').buffers()
    end,
    desc = 'Telescope buffers',
  },
}

return M
