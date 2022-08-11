local M = {
  app_wfs = {},
  global_wf = hs.window.filter.new(false),
}

-- add_app_wf adds a window filter for an application to the global window filter
function M.add_app_wf(app_name, keybinds)
  M.global_wf:allowApp(app_name)
  M.app_wfs[app_name] = keybinds
end

-- start starts the global window filter, subscribing to window events
function M.start()
  M.global_wf
    :subscribe(
      { hs.window.filter.windowFocused, hs.window.filter.windowVisible },
      function(_, app)
        for app_name, keybinds in pairs(M.app_wfs) do
          if app ~= app_name then
            goto continue
          end
          for _, keybind in ipairs(keybinds) do
            keybind:enable()
          end
          ::continue::
        end
      end
    )
    :subscribe({ hs.window.filter.windowUnfocused }, function(_, app)
      for app_name, keybinds in pairs(M.app_wfs) do
        if app ~= app_name then
          goto continue
        end
        for _, keybind in ipairs(keybinds) do
          keybind:disable()
        end
        ::continue::
      end
    end)
end

return M
