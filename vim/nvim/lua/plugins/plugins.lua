vim.cmd('packadd packer.nvim')
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'preservim/nerdtree'  -- View of directory
  use 'ryanoasis/vim-devicons'  -- Icons for various plugins
  use { 'folke/tokyonight.nvim', branch = 'main' }  -- Colorscheme
  use 'declancm/cinnamon.nvim'  -- Scrolling
  use 'numToStr/FTerm.nvim'  -- Terminal inside vim session
  use 'tpope/vim-surround'  -- Surround text with anything
  use 'tpope/vim-fugitive'  -- Git integration
  use 'airblade/vim-gitgutter'  -- Git changes in sign column
  use 'tpope/vim-commentary'  -- Commenting
  use 'tpope/vim-sleuth'  -- Setting tabs
  use 'tpope/vim-repeat'  -- Repeating mappings
  use 'mattn/emmet-vim'  -- Easy HTML editing
  use 'alvan/vim-closetag'  -- Closing tags for HTML
  use 'rhysd/clever-f.vim'  -- Movement with f and t
  use 'svermeulen/vim-easyclip'  -- Better clipboard control
  use 'matze/vim-move'  -- Moving lines/characters
  use 'github/copilot.vim'  -- Suggestions
  use 'dzfrias/vim-foldjump'  -- Easy fold movement
  use 'vim-scripts/applescript.vim'  -- AppleScript syntax highlighting
  use 'bfontaine/Brewfile.vim'  -- Brewfile syntax highlighting
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }  -- Go language support
  use 'tpope/vim-endwise'  -- Close statements automatically
  use 'tpope/vim-projectionist'  -- Easy project management/movement
  use 'dzfrias/vim-gojson'  -- Easy Go JSON field tags
  use 'dzfrias/vim-gitrebase'  -- Git rebase mappings
  use { 'python-mode/python-mode', ft = 'python', branch = 'develop' }  -- Python language support
  use 'jiangmiao/auto-pairs'  -- Auto-pairing of characters
  use 'ervandew/supertab'  -- Tab completion
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'  -- Fuzzy finder
  use 'tpope/vim-scriptease'  -- Make vimscript easier
  use 'puremourning/vimspector'  -- Debugging with DAP
  use 'phaazon/hop.nvim'  -- Easy movement in file
  use 'yegappan/mru'  -- Most recently used files
end)
