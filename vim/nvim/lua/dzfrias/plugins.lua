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
  use {
    'rrethy/vim-hexokinase',
    run = 'make hexokinase',
  }
  -- }}}

  -- {{{ Full tools------------------------------------------------------------
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'justinmk/vim-dirvish' -- Directory viewer

  use {
    'folke/todo-comments.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'dzfrias/plugins/todo-comments'
    end,
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
  }

  -- Async task runner
  use {
    'stevearc/overseer.nvim',
    config = function()
      require 'dzfrias/plugins/overseer'
    end,
    requires = { 'nvim-telescope/telescope.nvim', 'stevearc/dressing.nvim' },
  }

  use 'nvim-treesitter/playground'

  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-neotest/neotest-go',
      'rouge8/neotest-rust',
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
    ft = { 'html', 'css', 'markdown' },
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
    run = 'make',
    requires = 'nvim-telescope/telescope.nvim',
  }

  -- Google from neovim
  use {
    'dzfrias/gsearch.nvim',
    config = function()
      require 'dzfrias/plugins/gsearch'
    end,
    requires = { { 'nvim-telescope/telescope.nvim', tag = '0.1.0' } },
  }
  -- }}}

  -- {{{ General tools---------------------------------------------------------
  use 'tpope/vim-commentary' -- Commenting
  use 'tpope/vim-sleuth' -- Setting tabs
  use 'matze/vim-move' -- Moving lines/characters
  use 'christoomey/vim-tmux-navigator' -- Vim and tmux integration
  use 'vim-scripts/applescript.vim' -- AppleScript syntax highlighting
  use 'stevearc/dressing.nvim' -- Better UI defaults for vim
  use 'haya14busa/is.vim' -- Better searching
  use 'windwp/nvim-ts-autotag'

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

  -- {{{ Git-------------------------------------------------------------------
  -- Git integration
  use 'kdheepak/lazygit.nvim'

  -- Git diffs in sign column and hunk interactions
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'dzfrias/plugins/gitsigns'
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

  -- {{{ Filetypes-------------------------------------------------------------
  -- Go language support
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
    config = function()
      require 'dzfrias/plugins/vim-go'
    end,
  }
  use {
    'simrat39/rust-tools.nvim',
    config = function()
      require 'dzfrias/plugins/rust-tools'
    end,
  }
  use 'dzfrias/scurry.vim'

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
  use {
    'williamboman/mason.nvim',
    config = function()
      require 'dzfrias/plugins/lsp/mason'
    end,
  }
  use {
    'williamboman/mason-lspconfig.nvim',
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
