return {
  desc = 'Make this task restart when tasks with the same arbitrary attribute are run',
  editable = false,
  params = {
    by = {
      desc = 'The attribute to use to determine if two tasks are the same',
      type = 'string',
      optional = true,
      default = 'name',
    },
  },
  constructor = function(params)
    return {
      on_pre_start = function(_, task)
        local tasks = require('overseer.task_list').list_tasks()
        for _, t in ipairs(tasks) do
          if t[params.by] == task[params.by] and t ~= task then
            task:dispose(true)
            t:restart(true)
            return false
          end
        end
      end,
    }
  end,
}
