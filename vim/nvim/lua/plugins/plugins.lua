return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Visuals
  use 'ryanoasis/vim-devicons'  -- Icons for various plugins
  use { 'folke/tokyonight.nvim', branch = 'main' }  -- Colorscheme

  -- Full tools
  use 'preservim/nerdtree'  -- View of directory
  use 'numToStr/FTerm.nvim'  -- Terminal inside vim session
  use 'github/copilot.vim'  -- Suggestions
  use 'yegappan/mru'  -- Most recently used files

  -- Git
  use 'tpope/vim-fugitive'  -- Git integration
  use 'airblade/vim-gitgutter'  -- Git changes in sign column
  use 'dzfrias/vim-gitrebase'  -- Git rebase mappings

  -- General tools
  use 'tpope/vim-surround'  -- Surround text with anything
  use 'tpope/vim-commentary'  -- Commenting
  use 'tpope/vim-sleuth'  -- Setting tabs
  use 'tpope/vim-repeat'  -- Repeating mappings
  use 'tpope/vim-projectionist'  -- Easy project management/movement
  use 'tpope/vim-scriptease'  -- Make vimscript easier
  use 'rhysd/clever-f.vim'  -- Movement with f and t
  use 'svermeulen/vim-easyclip'  -- Better clipboard control
  use 'matze/vim-move'  -- Moving lines/characters
  use 'dzfrias/vim-foldjump'  -- Easy fold movement
  use 'declancm/cinnamon.nvim'  -- Scrolling
  use 'jiangmiao/auto-pairs'  -- Auto-pairing of characters

  -- HTML
  use 'mattn/emmet-vim'  -- Easy HTML editing
  use 'alvan/vim-closetag'  -- Closing tags for HTML

  -- Misc filetypes
  use 'vim-scripts/applescript.vim'  -- AppleScript syntax highlighting
  use 'bfontaine/Brewfile.vim'  -- Brewfile syntax highlighting

  -- Debugger
  use 'puremourning/vimspector'  -- Debugging with DAP

  -- Go
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }  -- Go language support
  use 'dzfrias/vim-gojson'  -- Easy Go JSON field tags

  -- fzf
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'  -- Fuzzy finder

  -- Snippets
  use 'L3MON4D3/LuaSnip'  -- Snippet engine
  use 'rafamadriz/friendly-snippets'  -- A ton of useful snippets

  -- LSP and autocomplete
  use 'neovim/nvim-lspconfig'  -- LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'  -- cmp and luasnip integration

end)
