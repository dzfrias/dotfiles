require('overseer').setup {
  task_list = {
    bindings = {
      ['<M-l>'] = 'IncreaseDetailAll',
      ['<M-h>'] = 'DecreaseDetailAll',
      ['L'] = 'IncreaseDetail',
      ['H'] = 'DecreaseDetail',
      ['q'] = '<Cmd>quit<CR>',
      ['K'] = 'PrevTask',
      ['J'] = 'NextTask',
      ['r'] = '<Cmd>OverseerQuickAction restart<CR>',
    },
  },
  task_editor = {
    bindings = {
      i = {
        ['<Esc>'] = '<Cmd>quit<CR>',
      },
      n = {
        ['q'] = '<Cmd>quit<CR>',
      },
    },
  },
  templates = { 'builtin', 'run' },
}
