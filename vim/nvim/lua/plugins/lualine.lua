require('lualine').setup {
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_b = { 'branch', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'filetype' },
  },
}
