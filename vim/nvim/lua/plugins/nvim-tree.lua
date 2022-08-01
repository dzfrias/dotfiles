require('nvim-tree').setup {
  view = {
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
        { key = 't', action = 'tabnew' },
        { key = 'go', action = 'cd' }
      },
    },
  },
}
