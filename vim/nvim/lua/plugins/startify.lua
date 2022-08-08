local in_repo = not vim.fn.system('git status'):find 'fatal:'

local function list_commits()
  if not in_repo then
    return {}
  end
  commits = vim.fn.systemlist 'git log --oneline | head -n5'
  res = {}
  for _, v in ipairs(commits) do
    res[#res + 1] = {
      line = vim.fn.matchstr(v, '\\s\\zs.*'),
      cmd = 'Git show ' .. vim.fn.matchstr(v, '^\\x\\+'),
    }
  end
  return res
end

vim.g.startify_lists = {
  { type = 'commands', header = { 'Commands' } },
  { type = list_commits, header = { 'Commits' } },
}

local commands = {
  { e = { '  Empty buffer', 'enew' } },
  { f = { '  Find file', 'Telescope find_files cwd=' .. require('util').get_project_root() } },
  { t = { '  Todo', 'TODO' } },
  { q = { 'ﰸ  Quit', 'quit' } },
}
if in_repo then
  table.insert(commands, 1, { s = { '  Git summary', 'Git' } })
end
-- Get number of buffers
if #vim.fn.getbufinfo { buflisted = 1 } > 0 then
  table.insert(commands, #commands, { b = { '  Go back', 'bprevious' } })
end
vim.g.startify_commands = commands

vim.g.startify_enable_special = false
