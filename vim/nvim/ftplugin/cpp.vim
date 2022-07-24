function s:Eatchar(pat)
    " See :h Eatchar for information on this function
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction
" Remove whitespace after the abbreviation
iabbrev <buffer> <silent> std std::<C-r>=<SID>Eatchar('\m\s\<bar>/')<CR>

let b:callcmd='g+ ' . @%
