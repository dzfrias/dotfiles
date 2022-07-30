local g = vim.g


-- emmet-vim
g.user_emmet_install_global = 0
local emmet = vim.api.nvim_create_augroup('emmet', {})
vim.api.nvim_create_autocmd(
  'BufEnter',
  {
    group = emmet,
    pattern = {'*.html', '*.css'},
    command = 'EmmetInstall'
  }
)


-- vim-go
g.go_fmt_command = 'goimports'
g.go_doc_keywordprg_enabled = 0
g.go_auto_type_info = 1
g.go_metalinter_autosave = 1


-- clever-f
g.clever_f_across_no_line = 1
g.clever_f_mark_direct = 1


-- vimspector
-- nnoremap <leader>dq <Cmd>call vimspector#Reset()<CR>
-- nnoremap <leader>dc <Cmd>call vimspector#Continue()<CR>

-- nnoremap <leader>dt <Cmd>call vimspector#ToggleBreakpoint()<CR>
-- nnoremap <leader>dm <Cmd>call vimspector#ToggleBreakpoint({'logMessage' = printf('log point at line %d in file "%s" reached!', line('.'), expand('%'))})<CR>
-- nnoremap <leader>dT <Cmd>call vimspector#ClearBreakpoints()<CR>

-- nnoremap <leader>dl <Plug>VimspectorStepInto
-- nnoremap <leader>dh <Plug>VimspectorStepOut
-- nnoremap <leader>dj <Plug>VimspectorStepOver
-- nnoremap <leader>dk <Plug>VimspectorRestart

-- nnoremap <leader>dz <Plug>VimspectorRunToCursor
-- nnoremap <leader>di <Plug>VimspectorBalloonEval
-- xnoremap <leader>di <Plug>VimspectorBalloonEval


-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "vim", "go", "lua", "json" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gn",
      node_incremental = "gn",
      scope_incremental = "gs",
      node_decremental = "gN",
    },
  },
}


-- copilot.nvim
g.copilot_filetypes = {
  python = true,
  zsh = true,
  zshrc = true,
  sh = true,
  bash = true,
  html = true,
  css = true,
  js = true,
  json = true,
  vim = true,
  vimrc = true,
  applescript = true
}
g.copilot_filetypes['*'] = false


-- vim-easyclip
g.EasyClipAutoFormat = 1


-- auto-pairs
g.AutoPairsMapCh = 0


-- hop.nvim
require('hop').setup()


-- gitgutter
g.gitgutter_map_keys = 0


-- fzf
g.fzf_layout = { window = { width = 0.9, height = 0.7 } }


-- pymode
g.pymode_rope_goto_definition_bind = 'gd'
g.pymode_lint_ignore = {'E501'}
g.pymode_doc_bind = '<C-p>'
g.pymode_run_bind = '<leader>r'


-- supertab
g.SuperTabDefaultCompletionType = 'context'


-- vim-fugitive
-- autocmd User FugitivePager
-- \ nnoremap <buffer> <s-j> zj |
-- \ nnoremap <buffer> <s-k> <Plug>FoldJumpUp |
-- \ nnoremap <buffer> q ZZ |
-- \ nnoremap <buffer> <s-CR> <C-6>


-- cinnamon.nvim
require('cinnamon').setup()


-- tokyonight.nvim
g.tokyonight_style = 'night'
