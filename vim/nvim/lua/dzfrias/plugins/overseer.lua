-- TODO: Make generic run format for files that don't need project-based run
-- configs, like zsh files, applescript files, and markdown files. Make it like
-- the API of code_runner, a table with the filetype and command.

require('overseer').setup {
  templates = { 'builtin', 'run', 'run_noargs' },
}
