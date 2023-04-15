local no_require = { '.', '..', 'util.lua', 'init.lua', 'Spoons', '.DS_Store' }

for file in hs.fs.dir '.' do
  if hs.fnutils.contains(no_require, file) then
    goto continue
  end
  if file:find '.lua' then
    require(file:sub(1, -5))
  else
    require(file)
  end
  ::continue::
end

require('app_wf').start()
