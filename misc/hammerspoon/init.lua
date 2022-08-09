local no_require = { '.', '..', 'util.lua', 'init.lua', 'Spoons' }

for file in hs.fs.dir('.') do
  if not hs.fnutils.contains(no_require, file) then
    if file:find('.lua') then
      require(file:sub(1, -5))
    else
      require(file)
    end
  end
end
