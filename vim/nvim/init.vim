" vim: set foldmethod=marker foldmarker=---,--:

" --- VIM
" Adds ~/.vim to runtimepath
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" --


" --- PLUGINS
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'declancm/cinnamon.nvim'
Plug 'numToStr/FTerm.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'rhysd/clever-f.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'matze/vim-move'
Plug 'github/copilot.vim'
Plug 'dzfrias/vim-foldjump'
Plug 'vim-scripts/applescript.vim'
Plug 'bfontaine/Brewfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'dzfrias/vim-gojson'
Plug 'dzfrias/vim-gitrebase'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-scriptease'
Plug 'puremourning/vimspector'
" Doesn't work, so it was installed using vim's built in package manager. I've
" listed it here to document that it exists.
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
" Load settings for plugins
source ~/.config/nvim/plugin_settings.vim
" --


" --- SETTINGS
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
" --


" --- MAPPINGS
" -NORMAL-
" Jump down to nearest line with foldlevel > 0
noremap  <s-j>              zj
" Opens folds
noremap  <space>            za

" Go back to last place in insert mode
noremap  gi                 gi<Esc>

" Traversing tabs
noremap  <silent> <C-l>     :tabn<CR>
noremap  <silent> <C-h>     :tabp<CR>

" Simple editor commands
nnoremap <leader>w          :write<CR>
nnoremap <leader>s          :source %<CR>
nnoremap <silent> <leader>q :quit!<CR>
nnoremap <silent> <leader>e :write<CR>:edit<CR>
nnoremap <silent> <leader>v :Runtime<CR>:source $MYVIMRC<CR>
" fzf, see definition of ProjFiles below
nnoremap <silent> <leader>f :ProjFiles<CR>
nnoremap <silent> <C-n>     :NERDTreeToggle<CR>

" fugitive, see all in plugin_settings.vim
nnoremap <silent> gq        :G<CR>

" vimspector, see all in plugin_settings.vim
nnoremap <leader>dd         :call vimspector#LaunchWithSettings(#{configuration: 'run'})<CR>
nnoremap <leader>du         :call vimspector#LaunchWithSettings(#{configuration: 'test'})<CR>

" Move through windows
nnoremap <leader>k          <C-w>k
nnoremap <leader>l          <C-w>l
nnoremap <leader>h          <C-w>h
nnoremap <leader>j          <C-w>j

" Open floating terminal
nnoremap <silent> <leader>t :w<CR> :lua require('FTerm').toggle()<CR>
" Open floating terminal and call the command to run the file. Existed after
" the escape key is pressed.
nnoremap <silent> <leader>r :w<CR> :lua require('FTerm').run({vim.b.callcmd, '&&', 'read -n 1 && exit'})<CR>

" Trigger emmet autocomplete
nmap     <C-v>              <C-y>,

" Surround to end of line with vim-surround
nmap     ysS                ys$

" -INSERT-
" Traverse tabs better in insert mode
inoremap <silent> <C-l>     <Esc>:tabn<CR>
inoremap <silent> <C-h>     <Esc>:tabp<CR>
" Triggers omnifunc
inoremap <s-CR> <C-x><C-o>
" Trigger emmet autocomplete
imap     <C-v>              <C-y>,
" --


" --- COMMANDS & FUNCTIONS
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
function! CdToParent() abort
  let dir = expand('%:h')
  execute 'cd ' . dir
endfunction!
command! Cpd call CdToParent()
" --


" --- MISC
colorscheme tokyonight
packloadall
" --
