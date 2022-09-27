require('neotest').setup {
  adapters = {
    require 'neotest-go',
    require 'neotest-rust',
  },
  icons = {
    failed = '✗',
    passed = '✓',
  },
}
