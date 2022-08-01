-- vim: set foldmethod=marker:

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
  -- {{{ Visuals---------------------------------------------------------------
  use 'ryanoasis/vim-devicons'  -- Icons for various plugins
  -- Colorscheme
  use {
    'folke/tokyonight.nvim',
    branch = 'main'
  }
  -- }}}

  -- {{{ Full tools------------------------------------------------------------
  use 'preservim/nerdtree'  -- View of directory
  use 'numToStr/FTerm.nvim'  -- Terminal inside vim session
  use 'yegappan/mru'  -- Most recently used files
  use 'wbthomason/packer.nvim' -- Packer can manage itself

  -- Fzf
  use 'junegunn/fzf'
  use {
    'junegunn/fzf.vim',
    config = function()
      require('plugins/fzf')
    end
  }

  -- AI suggestions
  use {
    'github/copilot.vim',
    ft = {
      'python',
      'zsh',
      'lua',
      'zshrc',
      'sh',
      'bash',
      'html',
      'css',
      'js',
      'json',
      'vim',
      'vimrc',
      'applescript'
    }
  }
  -- }}}

  -- {{{ Git-------------------------------------------------------------------
  use 'dzfrias/vim-gitrebase'  -- Git rebase mappings
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
  use 'tpope/vim-surround'  -- Surround text with anything
  use 'tpope/vim-commentary'  -- Commenting
  use 'tpope/vim-sleuth'  -- Setting tabs
  use 'tpope/vim-repeat'  -- Repeating mappings
  use 'tpope/vim-projectionist'  -- Easy project management/movement
  use 'tpope/vim-scriptease'  -- Make vimscript easier
  use 'matze/vim-move'  -- Moving lines/characters
  use 'dzfrias/vim-foldjump'  -- Easy fold movement
  use 'nvim-lua/plenary.nvim' -- Better lua editing

  -- Better movement with f and t
  use {
    'rhysd/clever-f.vim',
    config = function()
      require('plugins/clever-f')
    end
  }

  -- Better clipboard control
  use {
    'svermeulen/vim-easyclip',
    config = function()
      require('plugins/easyclip')
    end
  }

  -- Scrolling
  use {
    'declancm/cinnamon.nvim',
    config = function()
      require('plugins/cinnamon')
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
  use 'alvan/vim-closetag'  -- Closing tags for HTML
  -- Easy HTML editing
  use {
    'mattn/emmet-vim',
    ft = { 'html', 'css' },
  }
  -- }}}

  -- {{{ Misc filetypes--------------------------------------------------------
  use 'vim-scripts/applescript.vim'  -- AppleScript syntax highlighting
  use 'bfontaine/Brewfile.vim'  -- Brewfile syntax highlighting
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
  use 'dzfrias/vim-gojson'  -- Easy Go JSON field tags
  -- Go language support
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
    config = function()
      require('plugins/vim-go')
    end
  }
  -- }}}

  -- {{{ Snippets--------------------------------------------------------------
  use 'rafamadriz/friendly-snippets'  -- A ton of useful snippets
  -- Snippet engine
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require('plugins/luasnip')
    end
  }
  -- }}}

  -- {{{ LSP and autocomplete--------------------------------------------------
  -- See plugins/lsp-config.lua for configuration of all of these
  use 'neovim/nvim-lspconfig'  -- LSP
  use 'jose-elias-alvarez/null-ls.nvim'  -- Null LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'  -- cmp and luasnip integration
  use 'hrsh7th/cmp-path'  -- Path autocompletion for cmp
  -- }}}
end)
