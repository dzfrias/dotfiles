return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    keys = {
      {
        '-',
        function()
          require('oil').open()
        end,
        desc = 'Open oil',
      },
    },
    opts = {
      keymaps = {
        ['<C-v>'] = 'actions.select_vsplit',
        ['<C-x>'] = 'actions.select_split',
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['q'] = 'actions.close',
      },
    },
  },

  {
    'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    cmd = { 'Trouble', 'TroubleToggle' },
    keys = {
      {
        '<leader>x',
        '<Cmd>TroubleToggle workspace_diagnostics<CR>',
        desc = 'Open Trouble',
      },
    },
    config = true,
  },

  'christoomey/vim-tmux-navigator', -- Vim and tmux integration
  'tpope/vim-sleuth',

  {
    'Wansmer/treesj',
    keys = {
      {
        '<Space>j',
        function()
          require('treesj').toggle()
        end,
        desc = 'Toggle split and join',
      },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      use_default_keymaps = false,
    },
  },

  {
    'chrisgrieser/nvim-various-textobjs',
    keys = {
      { 'iS', mode = 'o' },
      { 'aS', mode = 'o' },
      { 'ii', mode = 'o' },
      { 'ai', mode = 'o' },
      { 'aI', mode = 'o' },
      { 'iI', mode = 'o' },
      { 'R', mode = 'o' },
      { '%', mode = 'o' },
      { 'r', mode = 'o' },
      { 'gG', mode = 'o' },
      { 'n', mode = 'o' },
      { 'i_', mode = 'o' },
      { 'a_', mode = 'o' },
      { '|', mode = 'o' },
      { 'av', mode = 'o' },
      { 'iv', mode = 'o' },
      { 'ik', mode = 'o' },
      { 'ak', mode = 'o' },
      { 'L', mode = 'o' },
      { 'in', mode = 'o' },
      { 'an', mode = 'o' },
      { '!', mode = 'o' },
      { 'iz', mode = 'o' },
      { 'az', mode = 'o' },
      { 'im', mode = 'o' },
      { 'am', mode = 'o' },
      { 'gw', mode = 'o' },
      { 'gW', mode = 'o' },
    },
    opts = { useDefaultKeymaps = true },
  },

  {
    'matze/vim-move',
    keys = {
      { '<A-k>', mode = { 'v', 'n' }, desc = 'Move up' },
      { '<A-j>', mode = { 'v', 'n' }, desc = 'Move down' },
      { '<A-l>', mode = { 'v', 'n' }, desc = 'Move left' },
      { '<A-h>', mode = { 'v', 'n' }, desc = 'Move right' },
    },
  },

  {
    'haya14busa/is.vim',
    keys = {
      { '/', desc = 'Search' },
      { '?', desc = 'Search backwards' },
      { 'n', desc = 'Next match' },
      { 'N', desc = 'Previous match' },
      { '*', desc = 'Search word under cursor' },
      { '#', desc = 'Search word under cursor backwards' },
    },
  },

  {
    'numToStr/Comment.nvim',
    keys = { { 'gc', mode = { 'v', 'n' }, desc = 'Comment' } },
    config = true,
  },

  -- Surround text
  {
    'tpope/vim-surround',
    keys = {
      { 'ys', desc = 'Surround' },
      { 'S', mode = 'v', desc = 'Surround' },
      { 'ds', desc = 'Delete surrounding' },
      { 'cs', desc = 'Change surrounding' },
    },
    dependencies = 'tpope/vim-repeat',
  },

  -- Better movement with f and t
  {
    'rhysd/clever-f.vim',
    keys = {
      { 'f', mode = { 'n', 'o' }, desc = 'Motion to character' },
      { 'F', mode = { 'n', 'o' }, desc = 'Motion to character backwards' },
      { 't', mode = { 'n', 'o' }, desc = 'Motion to behind character' },
      {
        'T',
        mode = { 'n', 'o' },
        desc = 'Motion to behind character backwards',
      },
    },
    config = function()
      -- Do not use f over multiple lines
      vim.g.clever_f_across_no_line = 1
      -- Show the places that can be directly jumped to
      vim.g.clever_f_mark_direct = 1
    end,
  },

  -- Better clipboard control
  {
    'svermeulen/vim-easyclip',
    keys = {
      { 'y', mode = { 'n', 'v' }, desc = 'Yank' },
      { 'p', mode = { 'n', 'v' }, desc = 'Paste' },
      { 'P', mode = { 'n', 'v' }, desc = 'Past above' },
      { 'Y', mode = { 'n', 'v' }, desc = 'Yank until end of line' },
      { 'm', mode = { 'n', 'v' }, desc = 'Cut' },
      { 'd', mode = { 'n', 'v' }, desc = 'Delete' },
      { 'D', mode = { 'n', 'v' }, desc = 'Delete until end of line' },
      { 'c', mode = { 'n', 'v' }, desc = 'Change' },
      { 'C', mode = { 'n', 'v' }, desc = 'Change until end of line' },
    },
    dependencies = 'tpope/vim-repeat',
  },

  -- Auto pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function(_, options)
      local npairs = require 'nvim-autopairs'
      local Rule = require 'nvim-autopairs.rule'

      npairs.setup(options)

      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
      npairs.add_rules {
        Rule(' ', ' '):with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end),
      }
      for _, bracket in pairs(brackets) do
        npairs.add_rules {
          Rule(bracket[1] .. ' ', ' ' .. bracket[2])
            :with_pair(function()
              return false
            end)
            :with_move(function(opts)
              return opts.prev_char:match('.%' .. bracket[2]) ~= nil
            end)
            :use_key(bracket[2]),
        }
      end
    end,
  },
}
