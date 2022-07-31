local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

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
