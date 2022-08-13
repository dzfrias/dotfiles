return {
  desc = 'Make a task unique by name',
  editable = false,
  constructor = function()
    return {
      on_pre_start = function(_, task)
        local tasks = require('overseer.task_list').list_tasks()
        for _, t in ipairs(tasks) do
          if t.name == task.name and t ~= task then
            task:dispose(true)
            t:restart(true)
            return false
          end
        end
      end,
    }
  end,
}
