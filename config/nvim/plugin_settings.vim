" -vim-signature-
let g:SignatureMarkTextHLDynamic = 1


" -emmet-vim-
let g:user_emmet_install_global = 0
autocmd BufRead,BufNewFile *.htm,*.html,*.css EmmetInstall


" -clever-f-
let g:clever_f_across_no_line = 1
let g:clever_f_mark_direct = 1


" -markdown-preview-
let g:mkdp_page_title = '${name} - Markdown'


" -vim-easyclip-
let g:EasyClipAutoFormat = 1
let g:EasyClipUseCutDefaults = 0


" -cinnamon.nvim-
lua require('cinnamon').setup()


" -nerdtree-
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" -vim-commentary-
" Sets applescript comments to --
autocmd BufRead *.scpt setlocal commentstring=--%s


" -coc-
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-python', 'coc-prettier']
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" Disable < pairs in html, vim-autoclose is better
autocmd BufRead,BufNewFile *.htm,*.html let b:coc_pairs_disabled = ["<"]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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
