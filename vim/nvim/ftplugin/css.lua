local bufnoremap = require('util').bufnoremap

bufnoremap('i', 'ee', '<Plug>(emmet-expand-abbr)')
bufnoremap('n', '<C-v>', '<Plug>(emmet-expand-abbr)')
