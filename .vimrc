" -SETTINGS-
set relativenumber
syntax on
set nowrap
set hlsearch
set showmatch
set foldopen-=block

" Sets up nicer tab experience
set autoindent
set expandtab

" Sets up a colored columm on line 80
set colorcolumn=80
highlight ColorColumn ctermbg=42

" No nested folds, fold based on indend
set foldmethod=indent
set foldlevelstart=2
set foldnestmax=1

colorscheme zellner


" -MAPPINGS-
noremap <space> za
noremap gg gg0
" Puts semicolon at the end of a line
nnoremap <silent> <C-s> maA;<Esc>`a:delmarks a<CR>
nnoremap <CR> o<Esc>
inoremap jk <Esc>
" Pairs
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
