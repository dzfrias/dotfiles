return {
  -- Git in signcolumn
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    keys = {
      {
        'gp',
        function()
          require('gitsigns').preview_hunk()
        end,
        desc = 'Git preview hunk',
      },
      {
        'gr',
        function()
          require('gitsigns').reset_hunk()
        end,
        desc = 'Git reset hunk',
      },
      {
        'gD',
        function()
          require('gitsigns').setqflist()
        end,
        desc = 'Open list of diff hunks',
      },
      {
        'g]',
        function()
          require('gitsigns').next_hunk()
        end,
        desc = 'Go to next diff hunk',
      },
      {
        'g[',
        function()
          require('gitsigns').prev_hunk()
        end,
        desc = 'Go to previous diff hunk',
      },
    },
    opts = {
      attach_to_untracked = false,
      trouble = false,
    },
  },

  -- Git interface
  {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    keys = { { '<leader>g', '<Cmd>Neogit<CR>', desc = 'Open Neogit' } },
  },
}
