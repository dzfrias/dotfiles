require('neotest').setup {
  adapters = {
    require 'neotest-go',
  },
  consumers = {
    overseer = require 'neotest.consumers.overseer',
  },
}
