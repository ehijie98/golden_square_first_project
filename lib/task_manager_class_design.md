# TaskManager class Design Recipe 

## 1. Describe the Problem

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.

> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them disappear from the list.


## 2. Describe the Class Interface

``` ruby

class TaskManager

    def initialize(name) # takes name as a string argument
        # initialize method returns an empty list
        # returns error if non-string value is entered
    end


    def add(task) # takes task as string argument
        # pushes task into list
        # returns error if empty string or non-string value added otherwise returns nothing
    end

    def list # takes zero arguments
        # returns list of tasks to be completed
    end

    def completed(task) # takes task as string argument
        # removes task from list
        # returns error if task added is not in list otherwise returns nothing
    end

```


## 3. Create examples as tests

``` ruby

task_manager = TaskManager.new("Colin")

# 1
task_manager.add("wash the dishes")
task_manager.list 
# => "Colin needs to: ["wash the dishes"]"

# 2
task_manager.add(true)
# => Please add something feasible to your task manager!

# 3
task_manager.add(" ")
# => "Please add something feasible to your task manager!

# 4
task_manager.add("wash the dishes")
task_manager.add("tidy the boxes")
task_manager.list 
# => "Colin needs to: ["wash the dishes", "tidy the boxes"]"
task_manager.completed("wash the dishes")
task_manager.list
# => "Colin needs to: ["tidy the boxes"]"

# 5
task_manager.add("wash the dishes")
task_manager.add("tidy the boxes")
task_manager.completed("roll away the mat")
# => "This task is not present in your task manager"

```
## 4. Implement the behavior