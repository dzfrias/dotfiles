#!/Library/Frameworks/Python.framework/Versions/3.10/bin/python3

# Changes tasks' when uda to today if the when uda is set to before today
# Run on the first minute of every day


import json
from os import popen


def get_tasks():
    # Gets pending tasks with 'when' before today
    tasks = popen('task when.before:tod status:pending export').read()
    return json.loads(tasks)


def change_date(task_id: int):
    # Modifies the task to be set to today
    command = f'task modify {task_id} when:today rc.hooks=0'
    popen(command)


def main():
    tasks = get_tasks()

    for task in tasks:
        change_date(task['id'])


if __name__ == '__main__':
    main()
