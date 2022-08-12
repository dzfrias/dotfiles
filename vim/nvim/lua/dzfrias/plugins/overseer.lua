require('overseer').setup {
  task_list = {
    bindings = {
      ['<M-l>'] = 'IncreaseDetail',
      ['<M-h>'] = 'DecreaseDetail',
    },
  },
  templates = { 'builtin', 'run' },
}
