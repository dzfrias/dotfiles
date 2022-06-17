" Highlights comments with dashes around them
syntax match sectionHeader '\v# *-.+-'
highlight link sectionHeader HighlightComment

" Traverses sectionHeaders
noremap <silent> ‘ /\v# -.+-<CR>:noh<CR>
noremap <silent> “ ?\v# -.+-<CR>:noh<CR>

" Shebang line
iabbrev #! #!/bin/zsh
inoremap [[ [[  ]]<Esc>hhi

setlocal shiftwidth=2
setlocal softtabstop=2

let callcmd='zsh ' . @%
