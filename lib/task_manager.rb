class TaskManager

    def initialize(name)
        fail "Please enter name" unless name.is_a? String
        @list = []
        @name = name
    end

    def add(task)
        fail "Please add something feasible to your task manager!" unless task.is_a? String
        @list << task
    end

    def list
        fail "#{@name} has no tasks in their list" if @list.empty? 
        return "#{@name} needs to: #{@list}"
    end

    def completed(task)
        fail "This task is not present in your task manager" unless @list.include?(task)
        @list.delete(task)
    end

end