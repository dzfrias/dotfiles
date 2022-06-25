function Eatchar(pat)
    " See :h Eatchar for information on this function
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
" Removes whitespace after the abbreviation
iabbrev <buffer> <silent> std std::<C-r>=Eatchar('\m\s\<bar>/')<CR>

let b:callcmd='g+ ' . @%
