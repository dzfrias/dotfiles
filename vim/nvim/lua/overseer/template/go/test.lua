local overseer = require 'overseer'

return {
  name = 'Go test',
  builder = function(_)
    return {
      cmd = { 'go' },
      args = { 'test', '.' },
    }
  end,
  tags = { overseer.TAG.BUILD },
  condition = {
    filetype = { 'go' },
  },
}
