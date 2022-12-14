# Examples for To Do / To Do List 

``` ruby

# 1
todo_list = TodoList.new
task_1 = ToDo.new("one")
task_2 = ToDo.new("two")
task_1.mark_done!
todo_list.add(task_1)
todo_list.add(task_2)
todo_list.complete
# => task_1

# 2
todo_list = TodoList.new
task_1 = ToDo.new("one")
task_2 = ToDo.new("two")
task_1.mark_done!
todo_list.add(task_1)
todo_list.add(task_2)
todo_list.incomplete
# => task_2

# 3
todo_list = TodoList.new
task_1 = ToDo.new("one")
task_2 = ToDo.new("two")
todo_list.add(task_1)
todo_list.add(task_2)
todo_list.give_up!
todo_list.complete 
# => [task_1, task_2]

```