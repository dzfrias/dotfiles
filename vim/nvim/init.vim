" -VIM-------------------------------------------------------------------------
" Adds ~/.vim to runtimepath
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" -PLUGINS---------------------------------------------------------------------
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'declancm/cinnamon.nvim'
Plug 'numToStr/FTerm.nvim'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'rhysd/clever-f.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'matze/vim-move'
Plug 'github/copilot.vim'
Plug 'dzfrias/vim-foldjump'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/applescript.vim'
Plug 'bfontaine/Brewfile.vim'
call plug#end()


" -SETTINGS--------------------------------------------------------------------
set modeline
set hidden
set nobackup
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
let g:callcmd='echo ' . @%


" -MAPPINGS--------------------------------------------------------------------
" -NORMAL-
" Jump down to nearest line with foldlevel > 0
noremap  <s-j>              zj
" Opens folds
noremap  <space><space>     za
noremap  gi                 gi<Esc>
" Traversing tabs
noremap  <silent> <C-l>     :tabn<CR>
noremap  <silent> <C-h>     :tabp<CR>
nnoremap <leader>w          :write<CR>
nnoremap <silent> <C-n>     :NERDTreeToggle<CR>
" Open floating terminal
nnoremap <silent> <leader>t :w<CR> :lua require('FTerm').toggle()<CR>
" Open floating terminal and call the command to run the file. Existed after
" the escape key is pressed.
nnoremap <silent> <leader>r :w<CR> :lua require('FTerm').run({vim.b.callcmd, '&&', 'read -n 1 && exit'})<CR>
" For easyclip
nnoremap gm                 <Plug>MoveMotionPlug
nnoremap gmm                <Plug>MoveMotionLinePlug
" Trigger emmet autocomplete
nmap     <C-v>              <C-y>,
" Surround to end of line with vim-surround
nmap     ysS                ys$

" -INSERT-
" Traverse tabs better in insert mode
inoremap <silent> <C-l>     <Esc>:tabn<CR>
inoremap <silent> <C-h>     <Esc>:tabp<CR>
" Trigger emmet autocomplete
imap     <C-v>              <C-y>,

" -VISUAL-
" Make easyclip cut bound to gm rather than m
xnoremap gm                 <Plug>MoveMotionXPlug


" -COMMANDS & FUNCTIONS--------------------------------------------------------
" OverLineNo() checks if the total amount of lines is over 300, and if so,
" folds everything
function! OverLineNo()
    if line('$') > 300
        " Fold everything
        normal! zM
    endif
endfunction

autocmd BufRead * :call OverLineNo()


" -MISC------------------------------------------------------------------------
" Load settings for plugins
source ~/.config/nvim/plugin_settings.vim

let g:tokyonight_style = 'night'
colorscheme tokyonight
packloadall
