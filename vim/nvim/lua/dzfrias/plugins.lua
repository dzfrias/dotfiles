-- vim: set foldmethod=marker:

return require('lazy').setup {
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
    config = function()
      require 'dzfrias/plugins/treesitter'
    end,
    build = ':TSUpdate',
  },

  {
    'rrethy/vim-hexokinase',
    build = 'make hexokinase',
  },

  {
    'nvim-zh/colorful-winsep.nvim',
    event = 'VeryLazy',
    config = true,
  },
  -- }}}

  -- {{{ Full tools------------------------------------------------------------
  -- A directory explorer
  {
    'stevearc/oil.nvim',
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
    config = function()
      require 'dzfrias/plugins/lualine'
    end,
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

  -- Easy HTML editing
  {
    'mattn/emmet-vim',
    keys = {
      {
        '<C-l>',
        '<Plug>(emmet-expand-abbr)',
        mode = { 'i', 'n' },
        desc = 'Expand emmet',
      },
    },
  },

  -- Fzf-like filter
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = {
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
    },
    config = function()
      require 'dzfrias/plugins/telescope'
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'neovim/nvim-lspconfig',
      'kyazdani42/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },
  -- }}}

  -- {{{ General tools---------------------------------------------------------
  'christoomey/vim-tmux-navigator', -- Vim and tmux integration
  'nvim-lua/plenary.nvim',

  { 'tpope/vim-sleuth', event = 'VeryLazy' },

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
    'cbochs/grapple.nvim',
    keys = {
      {
        '<leader>m',
        function()
          require('grapple').toggle()
        end,
        desc = 'Toggle mark for grappling',
      },
      {
        '<leader>o',
        function()
          require('grapple').popup_tags()
        end,
        desc = 'Open grapple UI',
      },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'nguyenvukhang/nvim-toggler',
    keys = { '<leader>i' },
    opts = {
      inverses = {
        ['True'] = 'False',
      },
    },
  },

  {
    'levouh/tint.nvim',
    event = 'BufWinEnter',
    opts = {
      darken = -45,
      saturation = 0.4,
    },
  },

  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Surround text
  {
    'tpope/vim-surround',
    event = 'VeryLazy',
    dependencies = 'tpope/vim-repeat',
  },

  -- Better movement with f and t
  {
    'rhysd/clever-f.vim',
    keys = { 'f', 'F', 't', 'T' },
    config = function()
      require 'dzfrias/plugins/clever-f'
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
      require 'dzfrias/plugins/autopairs'
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
    },
  },
  -- }}}

  -- {{{ Debugger--------------------------------------------------------------
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
        },
      },
      {
        'nvim-telescope/telescope-dap.nvim',
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
          'nvim-telescope/telescope.nvim',
        },
      },
    },
    keys = {
      -- Run
      {
        '<leader>dd',
        '<Cmd>lua require("dap").continue()<CR>',
        desc = 'Open debugger',
      },

      -- Quit
      {
        '<leader>dq',
        '<Cmd>lua require("dap").terminate()<CR>',
        desc = 'Quit debugger',
      },

      -- Continue to breakpoint or start debugging if no session is active
      {
        '<leader>dc',
        '<Cmd>lua require("dap").continue()<CR>',
        desc = 'Go to next breakpoint in debugger',
      },
      -- Continue backwards until breakpoint
      {
        '<leader>dC',
        '<Cmd>lua require("dap").reverse_continue()<CR>',
        desc = 'Go to previous breakpoint in debugger',
      },

      -- Breakpoints
      {
        '<leader>dt',
        '<Cmd>lua require("dap").toggle_breakpoint()<CR>',
        desc = 'Toggle breakpoint in debugger',
      },

      -- Movement and navigation
      {
        '<leader>dl',
        '<Cmd>lua require("dap").step_into()<CR>',
        desc = 'Step into stack frame in debugger',
      },
      {
        '<leader>dh',
        '<Cmd>lua require("dap").step_out()<CR>',
        desc = 'Step out of stack frame in debugger',
      },
      {
        '<leader>dj',
        '<Cmd>lua require("dap").step_over()<CR>',
        desc = 'Step in debugger',
      },
      {
        '<leader>dk',
        '<Cmd>lua require("dap").step_back()<CR>',
        desc = 'Step up in debugger',
      },

      -- Misc
      {
        '<leader>dz',
        '<Cmd>lua require("dap").run_to_cursor()<CR>',
        desc = 'Step until cursor in debugger',
      },
      {
        '<leader>di',
        '<Cmd>lua require("dapui").eval()<CR>',
        mode = { 'n', 'x' },
        desc = 'Evaluate expression in debugger',
      },

      -- Telescope
      {
        '<leader>dv',
        '<Cmd>Telescope dap variables<CR>',
        desc = 'Telescope variables in debugger',
      },
      {
        '<leader>df',
        '<Cmd>Telescope dap frames<CR>',
        desc = 'Telescope stack frames in debugger',
      },
    },
    config = function()
      require 'dzfrias/plugins/dap'
    end,
  },
  -- }}}

  -- {{{ Filetypes-------------------------------------------------------------
  {
    'simrat39/rust-tools.nvim',
    ft = { 'rust', 'toml' },
    config = function()
      require 'dzfrias/plugins/rust-tools'
    end,
  },
  { 'dzfrias/scurry.vim', ft = 'scurry' },
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
    config = function()
      require 'dzfrias/plugins/lsp/null-ls'
    end,
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
        keys = {
          {
            '<C-j>',
            function()
              local luasnip = require 'luasnip'
              if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              end
            end,
            mode = 'i',
            silent = true,
          },
          {
            '<C-k>',
            function()
              require('luasnip').jump(-1)
            end,
            mode = { 'i', 's' },
            silent = true,
          },
          {
            '<C-j>',
            function()
              require('luasnip').jump(1)
            end,
            mode = { 's' },
            silent = true,
          },
        },
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
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      require 'dzfrias/plugins/cmp'
    end,
  },
}
