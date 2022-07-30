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


-- nvim-lspconfig
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<C-p>', vim.lsp.buf.hover, bufopts)
end

-- Format on save
local format = vim.api.nvim_create_augroup('format', {})
vim.api.nvim_create_autocmd(
  'BufWritePre',
  {
    group = format,
    pattern = '*',
    command = 'lua vim.lsp.buf.formatting()'
  }
)

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')

-- Set up language servers
local servers = { 'pyright', 'gopls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

-- nvim-cmp setup
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require('luasnip')
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      -- A snippet engine is required
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- <CR> to accept
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- <Tab> to advance completion
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- <s-tab> to go backwards in completion
    ['<s-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})


-- vim-go
g.go_doc_keywordprg_enabled = 0
g.go_auto_type_info = 1
g.go_fmt_autosave = 0
g.go_code_completion_enabled = 0


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
