let b:ale_linters = ['flake8', 'pyflakes']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
setlocal shiftwidth=4
setlocal softtabstop=4
set colorcolumn=79

let callcmd='py ' . @%

" Correct some spelling
iabbrev slef self
iabbrev sefl self

" Highlights self and cls to be red and italic
syntax keyword pythonKeyword self cls
highlight link pythonKeyword Keyword2
