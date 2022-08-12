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
  templates = { 'builtin', 'run' },
}
