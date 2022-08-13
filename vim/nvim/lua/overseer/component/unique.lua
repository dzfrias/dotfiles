return {
  desc = 'Make a task unique by name',
  editable = false,
  constructor = function()
    return {
      on_complete = function(_, task)
        local tasks = require('overseer.task_list').list_tasks()
        for _, t in ipairs(tasks) do
          if t.name == task.name and t ~= task then
            t:dispose()
          end
        end
      end,
    }
  end,
}
