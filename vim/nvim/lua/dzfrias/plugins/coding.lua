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
        ['<C-h>'] = '<Cmd>wincmd h<CR>',
        ['<C-l>'] = '<Cmd>wincmd l<CR>',
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
      { '<A-k>', mode = { 'v', 'n' } },
      { '<A-j>', mode = { 'v', 'n' } },
      { '<A-l>', mode = { 'v', 'n' } },
      { '<A-h>', mode = { 'v', 'n' } },
    },
  },

  { 'haya14busa/is.vim', keys = { '/', '?', 'n', 'N', '*', '#' } },

  {
    'numToStr/Comment.nvim',
    keys = { { 'gc', mode = { 'v', 'n' } } },
    config = true,
  },

  -- Surround text
  {
    'tpope/vim-surround',
    keys = { 'ys', { 'S', mode = 'v' }, 'ds' },
    dependencies = 'tpope/vim-repeat',
  },

  -- Better movement with f and t
  {
    'rhysd/clever-f.vim',
    keys = { 'f', 'F', 't', 'T' },
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
    keys = { 'y', 'p', 'P', 'Y', 'm', 'd', 'D', 'c', 'C' },
    dependencies = 'tpope/vim-repeat',
  },

  -- Auto pairs
  {
    'jiangmiao/auto-pairs',
    config = function()
      -- Do not map <C-h>
      vim.g.AutoPairsMapCh = 0
      vim.g.AutoPairsShortcutToggle = ''
      vim.g.AutoPairsShortcutFastWrap = ''
      vim.g.AutoPairsShortcutBackInsert = ''
      vim.g.AutoPairsShortcutJump = ''
    end,
  },
}
