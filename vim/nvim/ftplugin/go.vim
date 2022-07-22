function s:ToggleDebugger() abort
  if maparg('b', 'n') !=? '<Plug>(go-debug-breakpoint)'
    execute 'GoDebugStart'
  else
    execute 'GoDebugStop'
  endif
endfunction

function! s:SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" vim-go
nnoremap <buffer> <leader>r          :w<CR>:GoRun<CR>
nnoremap <buffer> <C-p>              <Plug>(go-doc)
nnoremap <buffer> <silent> <C-b>     :call <SID>ToggleDebugger()<CR>
nnoremap <buffer> <silent> <leader>b :GoDebugBreakpoint<CR>
call s:SetupCommandAlias('Db','GoDebugStart .')
call s:SetupCommandAlias('Cov','GoCoverageToggle .')
" cnoreabbrev <expr> Db ((getcmdtype() is# ':' && getcmdline() is# 'Db')?('GoDebugStart .'):('Db'))

" Gojson
nnoremap <buffer> <leader>g   <Plug>Gojson
nnoremap <buffer> <leader>gg  <Plug>Gojson
xnoremap <buffer> <leader>g   <Plug>Gojson

setlocal foldmethod=syntax
