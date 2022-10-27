-- TODO: Make bubbles lualine theme

require('lualine').setup {
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_b = { 'branch', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        symbols = {
          modified = ' [+]',
          readonly = ' [RO]',
        },
      },
    },
    lualine_x = { 'filetype' },
  },
}
