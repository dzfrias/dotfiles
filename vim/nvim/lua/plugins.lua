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
  use {
    'folke/tokyonight.nvim',  -- Colorscheme
    branch = 'main',
    config = function()
      require('plugins.tokyonight')
    end
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

  use {
    'github/copilot.vim',  -- AI Suggestinos
    config = function()
      require('plugins/copilot')
    end
  }
  -- }}}

  -- {{{ Git-------------------------------------------------------------------
  use 'dzfrias/vim-gitrebase'  -- Git rebase mappings
  use {
    'tpope/vim-fugitive',  -- Git integration
    config = function()
      require('plugins/fugitive')
    end
  }

  use {
    'airblade/vim-gitgutter',  -- Git signs in sign column
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

  use {
    'rhysd/clever-f.vim',  -- Better movement with f and t
    config = function()
      require('plugins/clever-f')
    end
  }

  use {
    'svermeulen/vim-easyclip',  -- Better clipboard control
    config = function()
      require('plugins/easyclip')
    end
  }

  use {
    'declancm/cinnamon.nvim',  -- Scrolling
    config = function()
      require('plugins/cinnamon')
    end
  }

  use {
    'jiangmiao/auto-pairs',  -- Auto-pairing of characters
    config = function()
      require('plugins/autopairs')
    end
  }
  -- }}}

  -- {{{ HTML------------------------------------------------------------------
  use 'alvan/vim-closetag'  -- Closing tags for HTML
  use {
    'mattn/emmet-vim',  -- Easy HTML editing
    config = function()
      require('plugins/emmet')
    end
  }
  -- }}}

  -- {{{ Misc filetypes--------------------------------------------------------
  use 'vim-scripts/applescript.vim'  -- AppleScript syntax highlighting
  use 'bfontaine/Brewfile.vim'  -- Brewfile syntax highlighting
  -- }}}

  -- {{{ Debugger--------------------------------------------------------------
  use {
    'puremourning/vimspector',  -- Debugging with DAP
    config = function()
      require('plugins/vimspector')
    end
  }
  -- }}}

  -- {{{ Go--------------------------------------------------------------------
  use 'dzfrias/vim-gojson'  -- Easy Go JSON field tags
  use {
    'fatih/vim-go',  -- Go language support
    run = ':GoUpdateBinaries',
    config = function()
      require('plugins/vim-go')
    end
  }
  -- }}}

  -- {{{ Snippets--------------------------------------------------------------
  use 'rafamadriz/friendly-snippets'  -- A ton of useful snippets
  use {  -- Snippet engine
    'L3MON4D3/LuaSnip',
    config = function()
      require('plugins/luasnip')
    end
  }
  -- }}}

  -- {{{ LSP and autocomplete--------------------------------------------------
  -- See plugins/lsp-config.lua for configuration of all of these
  use 'neovim/nvim-lspconfig'  -- LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'  -- cmp and luasnip integration
  -- }}}
end)
