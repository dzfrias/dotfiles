" -emmet-vim-
let g:user_emmet_install_global = 0
augroup emmet
  autocmd!
  autocmd BufRead,BufNewFile *.htm,*.html,*.css EmmetInstall
augroup END


" -vim-go-
let g:go_fmt_command = 'goimports'
let g:go_doc_keywordprg_enabled = 0
let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 1


" -clever-f-
let g:clever_f_across_no_line = 1
let g:clever_f_mark_direct = 1


" -vimspector-
nnoremap <silent> <leader>dq :call vimspector#Reset()<CR>
nnoremap <silent> <leader>dc :call vimspector#Continue()<CR>
nnoremap <silent> <leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <leader>dm :call vimspector#ToggleBreakpoint({'logMessage': printf('log point at line %d in file "%s" reached!', line('.'), expand('%'))})<CR>
nnoremap <silent> <leader>dT :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>dk          <Plug>VimspectorRestart
nnoremap <leader>dh          <Plug>VimspectorStepOut
nnoremap <leader>dl          <Plug>VimspectorStepInto
nnoremap <leader>dj          <Plug>VimspectorStepOver
nnoremap <leader>dz          <Plug>VimspectorRunToCursor
nnoremap <leader>di          <Plug>VimspectorBalloonEval
xnoremap <leader>di          <Plug>VimspectorBalloonEval


" -copilot.nvim-
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'python': v:true,
      \ 'zsh': v:true,
      \ 'zshrc': v:true,
      \ 'sh': v:true,
      \ 'bash': v:true,
      \ 'html': v:true,
      \ 'css': v:true,
      \ 'js': v:true,
      \ 'json': v:true,
      \ 'vim': v:true,
      \ 'vimrc': v:true,
      \ 'applescript': v:true,
      \ }


" -vim-easyclip-
let g:EasyClipAutoFormat = 1


" -gitgutter-
let g:gitgutter_map_keys = 0


" -fzf-
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }


" -pymode-
let g:pymode_rope_goto_definition_bind = 'gd'
let g:pymode_lint_ignore = ['E501']
let g:pymode_doc_bind = '<C-p>'
let g:pymode_run_bind = '<leader>r'


" -supertab-
let g:SuperTabDefaultCompletionType = 'context'


"-vim-fugitive-
" Open pager with these mappings
autocmd User FugitivePager
      \ nnoremap <buffer> <s-j> zj |
      \ nnoremap <buffer> <s-k> <Plug>FoldJumpUp |
      \ nnoremap <buffer> q ZZ |
      \ nnoremap <buffer> <s-CR> <C-6>
" Activated when :G buffer is entered
autocmd User FugitiveIndex
      \ nnoremap <buffer> <silent> <s-s> :Git add --all<CR> |
      \ nnoremap <buffer> <silent> <leader>p :Git push<CR>


" -cinnamon.nvim-
lua require('cinnamon').setup()


" -tokyonight.nvim-
let g:tokyonight_style = 'night'


" -nerdtree-
augroup nerdtree
  autocmd!
  " Exit Vim if NERDTree is the only window remaining in the only tab.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END
