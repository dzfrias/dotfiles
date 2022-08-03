-- vim: set foldmethod=marker:

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
  -- {{{ Visuals---------------------------------------------------------------
  use 'kyazdani42/nvim-web-devicons'  -- Icons

  -- Colorscheme
  use {
    'folke/tokyonight.nvim',
    branch = 'main'
  }
  -- Tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins/treesitter')
    end,
    run = ':TSUpdate'
  }
  -- }}}

  -- {{{ Full tools------------------------------------------------------------
  use 'yegappan/mru' -- Most recently used files
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'nvim-telescope/telescope.nvim' -- Fzf-like filter

  -- Run code
  use {
    'CRAG666/code_runner.nvim',
    config = function()
      require('plugins/code_runner')
    end
  }

  -- View of directory
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly',
    config = function()
      require('plugins/nvim-tree')
    end
  }

  -- AI suggestions
  use {
    'github/copilot.vim',
    config = function()
      require('plugins/copilot')
    end
  }
  -- }}}

  -- {{{ Git-------------------------------------------------------------------
  use 'dzfrias/vim-gitrebase' -- Git rebase mappings

  -- Git integration
  use {
    'tpope/vim-fugitive',
    config = function()
      require('plugins/fugitive')
    end
  }

  -- Git diffs in sign column
  use {
    'airblade/vim-gitgutter',
    config = function()
      require('plugins/gitgutter')
    end
  }
  -- }}}

  -- {{{ General tools---------------------------------------------------------
  use 'tpope/vim-commentary' -- Commenting
  use 'tpope/vim-sleuth' -- Setting tabs
  use 'tpope/vim-projectionist' -- Easy project management/movement
  use 'tpope/vim-scriptease' -- Make vimscript easier
  use 'matze/vim-move' -- Moving lines/characters
  use 'dzfrias/vim-foldjump' -- Easy fold movement
  use 'tpope/vim-repeat' -- Repeat everything
  use 'tpope/vim-surround' -- Surround text
  use 'tpope/vim-endwise' -- Automatically make end statements
  use 'nvim-lua/plenary.nvim'

  use {
    'ggandor/leap.nvim',
    config = function()
      require('plugins/leap')
    end
  }

  -- Better movement with f and t
  use {
    'rhysd/clever-f.vim',
    config = function()
      require('plugins/clever-f')
    end
  }

  -- Scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('plugins/neoscroll')
    end
  }

  -- Better clipboard control
  use {
    'svermeulen/vim-easyclip',
    config = function()
      require('plugins/easyclip')
    end
  }

  -- Auto pairs
  use {
    'jiangmiao/auto-pairs',
    config = function()
      require('plugins/autopairs')
    end
  }
  -- }}}

  -- {{{ HTML------------------------------------------------------------------
  use 'alvan/vim-closetag' -- Closing tags for HTML
  -- Easy HTML editing
  use {
    'mattn/emmet-vim',
    ft = { 'html', 'css' },
  }
  -- }}}

  -- {{{ Misc filetypes--------------------------------------------------------
  use 'vim-scripts/applescript.vim' -- AppleScript syntax highlighting
  use 'bfontaine/Brewfile.vim' -- Brewfile syntax highlighting
  -- }}}

  -- {{{ Debugger--------------------------------------------------------------
  -- Debugging with the DAP
  use {
    'puremourning/vimspector',
    config = function()
      require('plugins/vimspector')
    end
  }
  -- }}}

  -- {{{ Go--------------------------------------------------------------------
  use 'dzfrias/vim-gojson' -- Easy Go JSON field tags
  -- Go language support
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
    config = function()
      require('plugins/vim-go')
    end
  }
  -- }}}

  -- {{{ LSP-------------------------------------------------------------------
  -- Lsp setup
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins/lsp/lspconfig')
    end
  }
  -- Generic language server
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('plugins/lsp/null-ls')
    end
  }

  -- Lsp installer
  use 'williamboman/mason.nvim'
  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('plugins/lsp/mason')
    end
  }
  -- }}}
end)
