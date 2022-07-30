local g = vim.g
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end


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
-- Basic mappings
map('n', '<leader>dq', '<Cmd>call vimspector#Reset()<CR>')
map('n', '<leader>dc', '<Cmd>call vimspector#Continue()<CR>')

-- Breakpoints
map('n', '<leader>dt', '<Cmd>call vimspector#ToggleBreakpoint()<CR>')
map('n', '<leader>dm', '<Cmd>call vimspector#ToggleBreakpoint({"logMessage": printf("log point at line %d in file \'%s\' reached!", line("."), expand("%"))})<CR>')
map('n', '<leader>dT', '<Cmd>call vimspector#ClearBreakpoints()<CR>')

-- Movement and navigation
map('n', '<leader>dl', '<Plug>VimspectorStepInto')
map('n', '<leader>dh', '<Plug>VimspectorStepOut')
map('n', '<leader>dj', '<Plug>VimspectorStepOver')
map('n', '<leader>dk', '<Plug>VimspectorRestart')

-- Misc
map('n', '<leader>dz', '<Plug>VimspectorRunToCursor')
map('n', '<leader>di', '<Plug>VimspectorBalloonEval')
map('x', '<leader>di', '<Plug>VimspectorBalloonEval')


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
local copilot = {
  python = true,
  zsh = true,
  lua = true,
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
copilot['*'] = false
g.copilot_filetypes = copilot


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
vim.cmd [[
autocmd User FugitivePager
  \ nnoremap <buffer> <s-j> zj |
  \ nnoremap <buffer> <s-k> <Plug>FoldJumpUp |
  \ nnoremap <buffer> q ZZ |
  \ nnoremap <buffer> <s-CR> <C-6>
]]


-- cinnamon.nvim
require('cinnamon').setup()


-- tokyonight.nvim
g.tokyonight_style = 'night'