" -VIMRC-
let s:section_header_regex = '\v" -[^-]+-{2,}'

" NextLineIsSectionHeader() - returns 1 if the next line is a section header
function! s:NextLineIsSectionHeader(lnum)
    " Get next line
    let l:next_line=getline(a:lnum+1)
    " Check if it is a section header
    if l:next_line =~ s:section_header_regex
        return 1
    else
        return 0
    endif
endfunction

" GetVimrcFold is the foldexpr for vimrc and init.vim
function! GetVimrcFold(lnum)
    let l:line=getline(a:lnum)
    " Check if line is a section header
    if l:line =~? s:section_header_regex
        return '1'
    " Check if the line is blank
    elseif s:NextLineIsSectionHeader(a:lnum)
        return '0'
    endif
    return '1'
endfunction

" Check if editing vimrc or init.vim
if expand('%') =~? '\v.*(init.vim|vimrc)$'
    setlocal foldmethod=expr
    setlocal foldexpr=GetVimrcFold(v:lnum)
    " Fold all
    normal! zM
endif
