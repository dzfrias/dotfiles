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
  component_aliases = {
    default_neotest = {
      'on_output_summarize',
      'on_exit_set_status',
      'on_complete_notify',
      'on_complete_dispose',
      'unique',
    },
  },
}
