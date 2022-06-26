" Shebang line
iabbrev <buffer>  #!  /usr/local/bin/zsh
inoremap <buffer> [[  [[  ]]<Esc>hhi

setlocal shiftwidth=2
setlocal softtabstop=2

let b:callcmd='zsh ' . @%


" -ZSHRC-
function! GetZshrcFold(lnum)
    let l:line=getline(a:lnum)
    " Checks if line is a section header
    if l:line =~? '\v# -.+-'
        return '1'
    " Checks if the line is blank
    elseif l:line =~? '\v^\s*$'
        return '0'
    endif
    return '1'
endfunction

" Check if editing zshrc
if expand('%') =~? '\v.*zshrc$'
    setlocal foldmethod=expr
    setlocal foldexpr=GetZshrcFold(v:lnum)
    " Folds all
    normal! zM
endif
