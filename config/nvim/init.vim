" Runs vimrc
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" -PLUGINS-
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'chrisbra/NrrwRgn'
Plug 'psliwka/vim-smoothie'
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
call plug#end()


" -SETTINGS-
set modeline
set background =dark
" Sets cursor to line when not in normal mode
set guicursor  =c:ver20,i:ver20,ci:ver20,cr:ver20
" The time of updating, specifically used for plugins like gitgutter
set updatetime =100
" Sets clipboard to system clipboard
set clipboard  =unnamed
" The range of lines a modeline can be declared
set modelines  =1
" callcmd is used when \r is typed and the current file is run
let callcmd    ='echo ' . @%


" -NORMAL-
" Will jump between folds
noremap  <s-j>              zj
noremap  <s-k>              zk
" Opens folds
noremap  <space><space>     za
noremap  gi                 gi<Esc>
" Traversing tabs
noremap  <silent> <C-l>     :tabn<CR>
noremap  <silent> <C-h>     :tabp<CR>
nnoremap <leader>w          :write<CR>
nnoremap <C-n>              :NERDTreeToggle<CR>
" Opens floating terminal
nnoremap <silent> <leader>t :w<CR> :lua require('FTerm').toggle()<CR>
" Opens floating terminal and calls the command to run the file. It also is
" exited after any user input
nnoremap <silent> <leader>r :w<CR> :lua require('FTerm').run({vim.b.callcmd, '&&', 'read -n 1 && exit'})<CR>
" Triggers emmet autocomplete
nmap     <C-v>              <C-y>,
" Makes easyclip cut bound to gm rather than m
nmap     gm                 <Plug>MoveMotionPlug
nmap     gmm                <Plug>MoveMotionLinePlug

" -INSERT-
" Traversing tabs in insert mode
inoremap <silent> <C-l>     <Esc>:tabn<CR>
inoremap <silent> <C-h>     <Esc>:tabp<CR>
" Triggers emmet autocomplete
imap     <C-v>              <C-y>,
" Fixes alt key not working on macOS
imap     ‘                  <Plug>(copilot-next)
imap     “                  <Plug>(copilot-previous)

" -VISUAL-
" Makes easyclip cut bound to gm rather than m
xmap gm <Plug>MoveMotionXPlug


" -COMMANDS & FUNCTIONS-
function OverLineNo()
    " Checks total line numbers
    if str2nr(line('$')) > 300
        " Folds everything
        normal zM
    endif
endfunction

" Checks if the number of lines is over 300, and if so, fold all
autocmd BufRead * :call OverLineNo()


" -MISC-
" Loads settings for plugins
source ~/.config/nvim/plugin_settings.vim

let g:tokyonight_style = 'night'
colorscheme tokyonight
packloadall
