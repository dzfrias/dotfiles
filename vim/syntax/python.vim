" Light red and italic
highlight pythonReserved guifg=#f7768e gui=italic

syntax keyword pythonReserved    self cls
" Matches 'match' or 'case' when there is a : at the end and the word is at
" the start
syn match   pythonConditional   "\v^\s*case(.*:$)@="
syn match   pythonConditional   "\v^\s*match(.*:$)@="
