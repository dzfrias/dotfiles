#!/Library/Frameworks/Python.framework/Versions/3.10/bin/python3

# Changes tasks' when uda to today if the when uda is set to before today


import json
from datetime import date
from os import popen


def get_tasks():
    tasks = popen('task when.before:tod status:pending export').read()
    return json.loads(tasks)


def change_date(task_id: int):
    today = date.today().isoformat()
    command = f'task mod {task_id} when:{today}'
    popen(command)


def main():
    tasks = get_tasks()

    for task in tasks:
        change_date(task['id'])


if __name__ == '__main__':
    main()
