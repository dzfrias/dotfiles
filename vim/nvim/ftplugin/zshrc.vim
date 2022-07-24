let s:section_header_regex = '\v# -[^-]+-{2,}'

" NextLineIsSectionHeader() - returns 1 if the next line is a section header
function! s:NextLineIsSectionHeader(lnum) abort
    " Get next line
    let next_line = getline(a:lnum+1)
    " Check if it is a section header
    if next_line =~ s:section_header_regex
        return 1
    endif

    return 0
endfunction

" GetZshrcFold() is the foldexpr for zshrc
function! GetZshrcFold(lnum) abort
    let line_contents = getline(a:lnum)
    " Check if line is a section header
    if line_contents =~? s:section_header_regex
        return '1'
    " Check if the line is blank
    elseif s:NextLineIsSectionHeader(a:lnum)
        return '0'
    endif

    return '1'
endfunction

setlocal foldmethod=expr
setlocal foldexpr=GetZshrcFold(v:lnum)
" Fold all
normal! zM
