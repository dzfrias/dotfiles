-- vim: set foldmethod=marker:

return {
  -- {{{ Visuals---------------------------------------------------------------
  -- Colorscheme
  {
    'folke/tokyonight.nvim',
    branch = 'main',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight-night]]
    end,
  },

  -- Tree sitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = require 'dzfrias.plugins.treesitter',
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
    build = ':TSUpdate',
  },

  {
    'rrethy/vim-hexokinase',
    build = 'make hexokinase',
  },

  {
    'nvim-zh/colorful-winsep.nvim',
    event = 'WinNew',
    config = true,
  },

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    config = true,
  },
  -- }}}

  -- {{{ Full tools------------------------------------------------------------
  -- A directory explorer
  {
    'stevearc/oil.nvim',
    lazy = false,
    cmd = 'Oil',
    keys = {
      {
        '-',
        function()
          require('oil').open()
        end,
        desc = 'Open oil',
      },
    },
    opts = require 'dzfrias/plugins/oil',
  },

  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    opts = require 'dzfrias.plugins.lualine',
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

  -- Fzf-like filter
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    opts = require('dzfrias.plugins.telescope').opts,
    keys = require('dzfrias.plugins.telescope').keys,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'neovim/nvim-lspconfig',
      'kyazdani42/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
          require('telescope').load_extension 'fzf'
        end,
      },
    },
  },
  -- }}}

  -- {{{ General tools---------------------------------------------------------
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

  { 'stevearc/dressing.nvim', event = 'VeryLazy' }, -- Better UI defaults for vim

  {
    'levouh/tint.nvim',
    event = 'VeryLazy',
    opts = {
      darken = -45,
      saturation = 0.4,
    },
  },

  {
    'anuvyklack/windows.nvim',
    event = 'WinNew',
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
    config = function()
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require('windows').setup()
    end,
  },

  {
    'numToStr/Comment.nvim',
    keys = 'gc',
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
  -- }}}

  -- {{{ Git-------------------------------------------------------------------
  -- Git integration
  {
    'kdheepak/lazygit.nvim',
    keys = {
      { '<leader>g', '<Cmd>LazyGit<CR>', desc = 'Open lazygit' },
    },
  },

  -- Git diffs in sign column and hunk interactions
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    keys = require('dzfrias.plugins.gitsigns').keys,
    opts = require('dzfrias.plugins.gitsigns').opts,
  },
  -- }}}

  -- {{{ Debugger--------------------------------------------------------------
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        config = require('dzfrias.plugins.dap').config_dap_ui,
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        config = true,
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
        },
      },
      {
        'nvim-telescope/telescope-dap.nvim',
        config = function()
          require('telescope').load_extension 'dap'
        end,
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
          'nvim-telescope/telescope.nvim',
        },
      },
    },
    keys = require('dzfrias.plugins.dap').keys,
    config = require('dzfrias.plugins.dap').config_dap,
  },
  -- }}}

  -- {{{ Filetypes-------------------------------------------------------------
  {
    'simrat39/rust-tools.nvim',
    ft = { 'rust', 'toml' },
    opts = require 'dzfrias.plugins.rust-tools',
  },

  {
    'Canop/nvim-bacon',
    cmd = 'BaconList',
    keys = {
      { '<leader>Bl', '<Cmd>BaconList<CR>', desc = 'Open bacon' },
      {
        '<leader>Bn',
        '<Cmd>BaconLoad<CR><Cmd>BaconNext<CR>',
        desc = 'Go to next bacon result',
      },
      {
        '<leader>Bp',
        '<Cmd>BaconLoad<CR><Cmd>BaconPrev<CR>',
        desc = 'Go to previous bacon result',
      },
    },
  },

  { 'dzfrias/scurry.vim', ft = 'scurry' },

  { 'tridactyl/vim-tridactyl', ft = 'tridactyl' },
  -- }}}

  -- {{{ LSP-------------------------------------------------------------------
  -- LSP setup
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'dzfrias/plugins/lsp/lspconfig'
    end,
  },
  -- Generic language server
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = require 'dzfrias.plugins.lsp.null-ls',
  },

  -- LSP installer
  {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim', config = true },
    build = ':MasonUpdate',
    config = true,
  },
  -- }}}

  -- {{{ Autocomplete----------------------------------------------------------
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        keys = require('dzfrias.plugins.cmp').luasnip_keys,
        dependencies = {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load {
            paths = { '~/.dotfiles/vim/nvim/snippets' },
          }
        end,
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      {
        'hrsh7th/cmp-cmdline',
        config = require('dzfrias.plugins.cmp').cmdline_config,
      },
    },
    opts = require('dzfrias.plugins.cmp').opts,
  },
}
