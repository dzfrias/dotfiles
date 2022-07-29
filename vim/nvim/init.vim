" vim: set foldmethod=marker:

" {{{ VIM
" Adds ~/.vim to runtimepath
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" }}}


" {{{ PLUGINS
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'preservim/nerdtree'  " View of directory
Plug 'ryanoasis/vim-devicons'  " Icons for various plugins
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }  " Colorscheme
Plug 'declancm/cinnamon.nvim'  " Scrolling
Plug 'numToStr/FTerm.nvim'  " Terminal inside vim session
Plug 'tpope/vim-surround'  " Surround text with anything
Plug 'tpope/vim-fugitive'  " Git integration
Plug 'airblade/vim-gitgutter'  " Git changes in sign column
Plug 'tpope/vim-commentary'  " Commenting
Plug 'tpope/vim-sleuth'  " Setting tabs
Plug 'tpope/vim-repeat'  " Repeating mappings
Plug 'mattn/emmet-vim'  " Easy HTML editing
Plug 'alvan/vim-closetag'  " Closing tags for HTML
Plug 'rhysd/clever-f.vim'  " Movement with f and t
Plug 'svermeulen/vim-easyclip'  " Better clipboard control
Plug 'matze/vim-move'  " Moving lines/characters
Plug 'github/copilot.vim'  " Suggestions
Plug 'dzfrias/vim-foldjump'  " Easy fold movement
Plug 'vim-scripts/applescript.vim'  " AppleScript syntax highlighting
Plug 'bfontaine/Brewfile.vim'  " Brewfile syntax highlighting
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " Go language support
Plug 'tpope/vim-endwise'  " Close statements automatically
Plug 'tpope/vim-projectionist'  " Easy project management/movement
Plug 'dzfrias/vim-gojson'  " Easy Go JSON field tags
Plug 'dzfrias/vim-gitrebase'  " Git rebase mappings
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }  " Python language support
Plug 'jiangmiao/auto-pairs'  " Auto-pairing of characters
Plug 'ervandew/supertab'  " Tab completion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy finder
Plug 'junegunn/fzf.vim'  " Fuzzy finder
Plug 'tpope/vim-scriptease'  " Make vimscript easier
Plug 'puremourning/vimspector'  " Debugging with DAP
Plug 'phaazon/hop.nvim'  " Easy movement in file
Plug 'yegappan/mru'  " Most recently used files
" Doesn't work, so it was installed using vim's built in package manager. I've
" listed it here to document that it exists.
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Treesitter support
call plug#end()
" Load settings for plugins
source ~/.config/nvim/plugin_settings.vim
" }}}


" {{{ SETTINGS
set modeline
set hidden
set nobackup
set autoindent
set smartindent
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=number
set background=dark
" Sets cursor to line when not in normal mode
set guicursor=c:ver20,i:ver20,ci:ver20,cr:ver20
" The time of updating, specifically used for plugins like gitgutter
set updatetime=100
" Sets clipboard to system clipboard
set clipboard=unnamed
" The range of lines a modeline can be declared
set modelines=1
" callcmd is used when \r is typed and the current file is run
let g:callcmd = 'echo ' . @%
" }}}


" {{{ MAPPINGS
" -NORMAL-
" Jump down to nearest line with foldlevel > 0
noremap  <s-j>              zj
" Opens folds
noremap  <space>            za

" Go back to last place in insert mode
noremap  gi                 gi<Esc>

" Traversing tabs
noremap  <silent> <C-l>     <Cmd>tabn<CR>
noremap  <silent> <C-h>     <Cmd>tabp<CR>

" Simple editor commands
nnoremap <leader>w          <Cmd>write<CR>
nnoremap <leader>s          <Cmd>source %<CR>
nnoremap <silent> <leader>q <Cmd>quit!<CR>
nnoremap <silent> <leader>e <Cmd>write<CR><Cmd>edit<CR>
nnoremap <silent> <leader>v <Cmd>Runtime<CR><Cmd>source $MYVIMRC<CR>
" fzf, see definition of ProjFiles below
nnoremap <silent> <leader>f <Cmd>ProjFiles<CR>
nnoremap <silent> <C-n>     <Cmd>NERDTreeToggle<CR>

" fugitive, see all in plugin_settings.vim
nnoremap <silent> gq        <Cmd>Git<CR>
nnoremap <silent> gcm       <Cmd>Git add --all <bar> Git commit --verbose<CR>
nnoremap <silent> gp        <Cmd>Git push<CR>

" vimspector, see all in plugin_settings.vim
nnoremap <leader>dd         <Cmd>call vimspector#LaunchWithSettings(#{configuration: 'run'})<CR>
nnoremap <leader>du         <Cmd>call vimspector#LaunchWithSettings(#{configuration: 'test'})<CR>

nnoremap <C-f>              <Cmd>HopWord<CR>

" Move through windows
nnoremap <leader>k          <C-w>k
nnoremap <leader>l          <C-w>l
nnoremap <leader>h          <C-w>h
nnoremap <leader>j          <C-w>j

" Open floating terminal
nnoremap <silent> <leader>t <Cmd>w<CR><Cmd>lua require('FTerm').toggle()<CR>
" Open floating terminal and call the command to run the file. Existed after
" the escape key is pressed.
nnoremap <silent> <leader>r <Cmd>w<CR><Cmd>lua require('FTerm').run({vim.b.callcmd, '&&', 'read -n 1 && exit'})<CR>


" Trigger emmet autocomplete
nnoremap <C-v>              <Plug>(emmet-expand-abbr)

" Surround to end of line with vim-surround
nmap     ysS                ys$

" -INSERT-
" Traverse tabs better in insert mode
inoremap <silent> <C-l>     <Esc><Cmd>tabn<CR>
inoremap <silent> <C-h>     <Esc><Cmd>tabp<CR>
" Trigger emmet autocomplete
inoremap <C-v>              <Plug>(emmet-expand-abbr)
" }}}


" {{{ COMMANDS & FUNCTIONS
" OverLineNo folds everything if the line count is greater than 300
function! s:OverLineNo() abort
  if line('$') > 300
    " Fold everything
    normal! zM
  endif
endfunction
augroup bufread
  autocmd!
  autocmd BufRead * call <SID>OverLineNo()
augroup END

" FindProjRoot gets the root of the project, assuming it is using git
function! s:FindProjRoot(dir) abort
  let dir = fnamemodify(a:dir, ':p')
  let home = $HOME . '/'
  if dir ==? home || dir[:-4] ==? home
    return '.'
  endif
  if isdirectory(dir . '.git')
    return dir
  endif
  return s:FindProjRoot(dir . '/' . '..')
endfunction
command! -bang ProjFiles call fzf#vim#files(<SID>FindProjRoot('.'), <bang>0)

" CdToParent changes the current directory to the parent of the current file
function! s:CdToParent() abort
  let dir = expand('%:h')
  execute 'cd ' . dir
endfunction
command! Cpd call <SID>CdToParent()
" }}}


" {{{ MISC
colorscheme tokyonight
packloadall
" }}}
