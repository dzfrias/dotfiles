-- Global so it doesn't get garbage collected
Reload_watcher = hs.pathwatcher
  .new(os.getenv 'HOME' .. '/.hammerspoon/', function(files)
    local doReload = false
    for _, file in pairs(files) do
      if file:sub(-4) == '.lua' then
        doReload = true
      end
    end
    if doReload then
      hs.reload()
    end
  end)
  :start()
hs.alert.show 'Config loaded'
