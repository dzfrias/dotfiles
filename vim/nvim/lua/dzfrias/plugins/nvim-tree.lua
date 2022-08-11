require('nvim-tree').setup {
  hijack_directories = { enable = false },

  view = {
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
        { key = 't', action = 'tabnew' },
        { key = 'go', action = 'cd' },
      },
    },
  },
}
