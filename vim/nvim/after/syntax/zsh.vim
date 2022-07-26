" Light red and italic
highlight highlightComment guifg=#f7768e gui=italic

" Markers
syntax match highlightComment '\v# *\{\{\{ *.+' containedin=zshComment
syntax match highlightComment '\v# *\}\}\}' containedin=zshComment
