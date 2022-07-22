" -VIM-------------------------------------------------------------------------
" Adds ~/.vim to runtimepath
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" -PLUGINS---------------------------------------------------------------------
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
call plug#end()
" Load settings for plugins
source ~/.config/nvim/plugin_settings.vim


" -SETTINGS--------------------------------------------------------------------
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


" -MAPPINGS--------------------------------------------------------------------
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
nnoremap <leader>v          :source $MYVIMRC<CR>
" fzf, see definition of ProjFiles below
nnoremap <silent> <leader>f :ProjFiles<CR>
nnoremap <silent> <C-n>     :NERDTreeToggle<CR>

" fugitive
nnoremap <silent> gq        :G<CR>

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


" -COMMANDS & FUNCTIONS--------------------------------------------------------
" OverLineNo() checks if the total amount of lines is over 300, and if so,
" folds everything
function! s:OverLineNo()
  if line('$') > 300
    " Fold everything
    normal! zM
  endif
endfunction

autocmd BufRead * :call <SID>OverLineNo()
" Fzf's at the project root if possible. otherwise, at the current directory
command! -bang ProjFiles call fzf#vim#files(empty($PROJROOT) ? '.' : $PROJROOT, <bang>0)

" Stage all (activates when :G buffer is entered)
autocmd User FugitiveIndex
      \ nnoremap <silent> <s-s> :Git add --all<CR> |
      \ nnoremap <silent> <leader>p :Git push<CR>


" -MISC------------------------------------------------------------------------
colorscheme tokyonight
packloadall
