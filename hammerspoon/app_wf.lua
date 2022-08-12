local M = {
  app_wfs = {},
  global_wf = hs.window.filter.new(false),
}

-- add adds a window filter for an application to the global window filter
function M.add(app_name, keybinds)
  M.global_wf:allowApp(app_name)
  M.app_wfs[app_name] = keybinds
end

-- start starts the global window filter, subscribing to window events
function M.start()
  M.global_wf
    :subscribe(
      { hs.window.filter.windowFocused, hs.window.filter.windowVisible },
      function(_, app_name)
        if not M.app_wfs[app_name] then
          return
        end
        for _, keybind in ipairs(M.app_wfs[app_name]) do
          keybind:enable()
        end
      end
    )
    :subscribe({ hs.window.filter.windowUnfocused }, function(_, app_name)
      if not M.app_wfs[app_name] then
        return
      end
      for _, keybind in ipairs(M.app_wfs[app_name]) do
        keybind:disable()
      end
    end)
end

return M
