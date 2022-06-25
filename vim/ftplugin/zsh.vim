" Traverses sectionHeaders
noremap <buffer> <silent> ‘ /\v# -.+-<CR>:noh<CR>
noremap <buffer> <silent> “ ?\v# -.+-<CR>:noh<CR>

" Shebang line
iabbrev <buffer>  #!  /usr/local/bin/zsh
inoremap <buffer> [[  [[  ]]<Esc>hhi

setlocal shiftwidt =2
setlocal softtabstop=2

let b:callcmd='zsh ' . @%
