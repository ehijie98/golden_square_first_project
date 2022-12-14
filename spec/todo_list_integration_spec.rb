require 'todo'
require 'todo_list'

RSpec.describe "To Do List Integration" do
    context "adds multiple tasks to list" do
        it "returns completed tasks" do
            todo_list = TodoList.new
            task_1 = Todo.new("one")
            task_2 = Todo.new("two")
            task_1.mark_done!
            todo_list.add(task_1)
            todo_list.add(task_2)
            result = todo_list.complete
                expect(result).to eq [task_1]
        end

        it "returns incompleted tasks" do
            todo_list = TodoList.new
            task_1 = Todo.new("one")
            task_2 = Todo.new("two")
            task_1.mark_done!
            todo_list.add(task_1)
            todo_list.add(task_2)
            result = todo_list.incomplete
                expect(result).to eq [task_2] 
        end
    end

    context "tests give up! behaviour" do
        it "marks all tasks in list completed" do
            todo_list = TodoList.new
            task_1 = Todo.new("one")
            task_2 = Todo.new("two")
            todo_list.add(task_1)
            todo_list.add(task_2)
            todo_list.give_up!
            result = todo_list.complete
                expect(result).to eq [task_1, task_2]
        end

    end

end