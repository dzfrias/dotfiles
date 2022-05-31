" Highlights comments with dashes around them
syntax match sectionHeader '\v# *-.+-'
highlight link sectionHeader HighlightComment

" Traverses sectionHeaders
noremap <silent> <C-]> /\v# -.+-<CR>:noh<CR>
noremap <silent> <C-[> ?\v# -.+-<CR>:noh<CR>
