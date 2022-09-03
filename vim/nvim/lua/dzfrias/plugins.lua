-- vim: set foldmethod=marker:

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
  -- {{{ Visuals---------------------------------------------------------------
  -- Colorscheme
  use {
    'folke/tokyonight.nvim',
    branch = 'main',
  }
  -- Tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'dzfrias/plugins/treesitter'
    end,
    run = ':TSUpdate',
  }
  -- }}}

  -- {{{ Full tools------------------------------------------------------------
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'justinmk/vim-dirvish' -- Directory viewer
  use 'AndrewRadev/splitjoin.vim'

  -- Quick jumping across files
  use {
    'ggandor/leap.nvim',
    requires = 'tpope/vim-repeat',
  }

  use {
    'nvim-treesitter/playground',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  -- Async task runner
  use {
    'stevearc/overseer.nvim',
    config = function()
      require 'dzfrias/plugins/overseer'
    end,
    requires = { 'nvim-telescope/telescope.nvim', 'stevearc/dressing.nvim' },
  }

  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-neotest/neotest-go',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
    },
    config = function()
      require 'dzfrias/plugins/neotest'
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'dzfrias/plugins/lualine'
    end,
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'dzfrias/plugins/trouble'
    end,
  }

  -- Easy HTML editing
  use {
    'mattn/emmet-vim',
    ft = { 'html', 'css' },
  }

  -- Fzf-like filter
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require 'dzfrias/plugins/telescope'
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'neovim/nvim-lspconfig',
      'kyazdani42/nvim-web-devicons',
    },
  }
  -- Fuzzy finding algorithm for telescope
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    requires = 'nvim-telescope/telescope.nvim',
  }

  use {
    'nvim-telescope/telescope-project.nvim',
    requires = 'nvim-telescope/telescope.nvim',
  }

  -- AI suggestions
  use {
    'github/copilot.vim',
    config = function()
      require 'dzfrias/plugins/copilot/copilot'
    end,
    commit = 'c2e75a3a7519c126c6fdb35984976df9ae13f564',
    ft = require 'dzfrias/plugins/copilot/filetypes',
  }
  -- }}}

  -- {{{ Git-------------------------------------------------------------------
  -- Git integration
  use {
    'tpope/vim-fugitive',
    config = function()
      require 'dzfrias/plugins/fugitive'
    end,
  }

  -- Git diffs in sign column and hunk interactions
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'dzfrias/plugins/gitsigns'
    end,
  }
  -- }}}

  -- {{{ General tools---------------------------------------------------------
  use 'tpope/vim-commentary' -- Commenting
  use 'tpope/vim-sleuth' -- Setting tabs
  use 'tpope/vim-projectionist' -- Easy project management/movement
  use 'matze/vim-move' -- Moving lines/characters
  use 'dzfrias/vim-foldjump' -- Easy fold movement
  use 'tpope/vim-endwise' -- Automatically make end statements
  use 'tpope/vim-scriptease' -- Easier vimscript editing
  use 'christoomey/vim-tmux-navigator' -- Vim and tmux integration
  use 'vim-scripts/applescript.vim' -- AppleScript syntax highlighting
  use 'stevearc/dressing.nvim' -- Better UI defaults for vim
  use 'mattn/webapi-vim' -- HTTP requests

  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'dzfrias/plugins/treesitter-context'
    end,
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  -- Surround text
  use {
    'tpope/vim-surround',
    requires = 'tpope/vim-repeat',
  }

  use {
    'lewis6991/spellsitter.nvim',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'dzfrias/plugins/spellsitter'
    end,
  }

  -- Better movement with f and t
  use {
    'rhysd/clever-f.vim',
    config = function()
      require 'dzfrias/plugins/clever-f'
    end,
  }

  -- Better clipboard control
  use {
    'svermeulen/vim-easyclip',
    config = function()
      require 'dzfrias/plugins/easyclip'
    end,
    requires = 'tpope/vim-repeat',
  }

  -- Auto pairs
  use {
    'jiangmiao/auto-pairs',
    config = function()
      require 'dzfrias/plugins/autopairs'
    end,
  }
  -- }}}

  -- {{{ Debugger--------------------------------------------------------------
  use {
    'mfussenegger/nvim-dap',
    config = function()
      require 'dzfrias/plugins/dap' -- Has configurations for other Debugger plugins
    end,
  }
  use {
    'rcarriga/nvim-dap-ui',
    requires = 'mfussenegger/nvim-dap',
  }
  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
    },
  }
  use {
    'nvim-telescope/telescope-dap.nvim',
    requires = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',
    },
  }
  -- }}}

  -- {{{ Go--------------------------------------------------------------------
  -- Go language support
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
    config = function()
      require 'dzfrias/plugins/vim-go'
    end,
  }
  use {
    'buoto/gotests-vim',
    config = function()
      require 'dzfrias/plugins/gotests'
    end,
  }
  -- }}}

  -- {{{ LSP-------------------------------------------------------------------
  -- LSP setup
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'dzfrias/plugins/lsp/lspconfig'
    end,
  }
  -- Generic language server
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require 'dzfrias/plugins/lsp/null-ls'
    end,
  }

  -- LSP installer
  use 'williamboman/mason.nvim'
  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require 'dzfrias/plugins/lsp/mason'
    end,
    requires = { 'neovim/nvim-lspconfig', 'williamboman/mason.nvim' },
  }
  -- }}}

  -- {{{ Autocomplete----------------------------------------------------------
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require 'dzfrias/plugins/luasnip'
    end,
  }
  use {
    'rafamadriz/friendly-snippets',
    requires = 'L3MON4D3/LuaSnip',
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = 'L3MON4D3/LuaSnip',
    config = function()
      require 'dzfrias/plugins/cmp'
    end,
  }
  use {
    'saadparwaiz1/cmp_luasnip',
    requires = { 'L3MON4D3/LuaSnip', 'hrsh7th/nvim-cmp' },
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = { 'neovim/nvim-lspconfig', 'hrsh7th/nvim-cmp' },
  }
  use {
    'hrsh7th/cmp-buffer',
    requires = 'hrsh7th/nvim-cmp',
  }
  use {
    'hrsh7th/cmp-path',
    requires = 'hrsh7th/nvim-cmp',
  }
  use {
    'hrsh7th/cmp-cmdline',
    requires = 'hrsh7th/nvim-cmp',
  }
  -- }}}
end)
