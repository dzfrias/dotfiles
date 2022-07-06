" -vim-signature-
let g:SignatureMarkTextHLDynamic = 1


" -emmet-vim-
let g:user_emmet_install_global = 0
autocmd BufRead,BufNewFile *.htm,*.html,*.css EmmetInstall


" -vim-go-
let g:go_fmt_command = 'goimports'
let g:go_doc_keywordprg_enabled = 0


" -clever-f-
let g:clever_f_across_no_line = 1
let g:clever_f_mark_direct = 1


" -markdown-preview-
let g:mkdp_page_title = '${name} - Markdown'


" -copilot.nvim-
let g:copilot_filetypes = {'go': v:false}


" -vim-easyclip-
let g:EasyClipAutoFormat = 1
let g:EasyClipUseCutDefaults = 0


" -vim-fugitive-
" Open pager with these mappings
autocmd User FugitivePager 
      \ nnoremap <buffer> <s-j> zj |
      \ nnoremap <buffer> <s-k> <Plug>FoldJumpUp |
      \ nnoremap <buffer> q ZZ


" -cinnamon.nvim-
lua require('cinnamon').setup()


" -tokyonight.nvim-
let g:tokyonight_style = 'night'


" -nerdtree-
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" -coc-
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-python', 'coc-prettier']

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
