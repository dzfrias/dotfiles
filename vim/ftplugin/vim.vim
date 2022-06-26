" Traverses sectionHeaders
noremap <buffer> <silent> ‘ /\v" -.+-<CR>:noh<CR>
noremap <buffer> <silent> “ ?\v" -.+-<CR>:noh<CR>


" -VIMRC-
function! GetVimrcFold(lnum)
    let l:line=getline(a:lnum)
    " Checks if line is a section header
    if l:line =~? '\v" -.+-'
        return '1'
        " Checks if the line is blank
    elseif l:line =~? '\v^\s*$'
        return '0'
    endif
    return '1'
endfunction

" Check if editing zshrc
if expand('%') =~? '\v.*(init.vim|vimrc)$'
    setlocal foldmethod=expr
    setlocal foldexpr=GetVimrcFold(v:lnum)
    " Folds all
    normal! zM
endif
