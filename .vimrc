" -SETTINGS-
set relativenumber
syntax on
set nowrap
set hlsearch
set showmatch
set foldopen-=block
set autoindent
set expandtab
set colorcolumn=80
highlight ColorColumn ctermbg=42
set foldmethod=indent foldlevelstart=2 foldnestmax=1
colorscheme zellner

" -MAPPINGS-
noremap <space> za
noremap gg gg0
nnoremap <silent> <C-s> maA;<Esc>`a:delmarks a<CR>
nnoremap <CR> o<Esc>
inoremap jk <Esc>
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
