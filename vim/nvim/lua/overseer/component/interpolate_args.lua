local util = require 'dzfrias/util'

return {
  desc = 'Interpolate arguments of a task',
  editable = false,
  params = {
    hide_interpolation = {
      desc = 'Hide interpolation details',
      type = 'boolean',
      optional = true,
      default = true,
    },
  },
  constructor = function(params)
    return {
      on_init = function(self)
        self.interpolated_args = {}
      end,

      on_pre_start = function(self, task)
        for i, arg in ipairs(task.cmd) do
          if arg == '${file}' then
            local target = vim.fn.expand '%:p'
            task.cmd[i] = target
            self.interpolated_args[i] = { '${file}', target }
          elseif arg == '${proj_main}' then
            local ft = vim.o.filetype
            local main = util.get_main(ft)
            task.cmd[i] = main
            self.interpolated_args[i] = { '${proj_main}', main }
          elseif arg == '${proj_root}' then
            local target = util.get_project_root()
            task.cmd[i] = target
            self.interpolated_args[i] = { '${proj_root}', target }
          elseif arg == '${file_noext}' then
            local target = vim.fn.expand '%:p:r'
            task.cmd[i] = target
            self.interpolated_args[i] = { '${file_noext}', target }
          elseif arg == '${file_dir}' then
            local target = vim.fn.expand '%:p:h'
            task.cmd[i] = target
            self.interpolated_args[i] = { '${file_dir}', target }
          elseif arg == '${file_name}' then
            local target = vim.fn.expand '%:p:t'
            task.cmd[i] = target
            self.interpolated_args[i] = { '${file_name}', target }
          end
        end
      end,

      on_complete = function(self, task)
        if not params.hide_interpolation then
          return
        end
        for i, interpolation in pairs(self.interpolated_args) do
          task.cmd[i] = interpolation[1]
        end
      end,

      render = function(self, _, lines)
        if not params.hide_interpolation then
          return
        end
        if #self.interpolated_args == 0 then
          return
        end
        table.insert(lines, 'Interpolated arguments:')
        for _, interpolation in pairs(self.interpolated_args) do
          table.insert(
            lines,
            '  ' .. interpolation[1] .. ' -> ' .. interpolation[2]
          )
        end
      end,
    }
  end,
}
