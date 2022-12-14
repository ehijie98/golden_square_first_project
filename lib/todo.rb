class Todo
    def initialize(task) # task is a string
      # ...
      fail "Please ensure task is a string value with contents" unless task.is_a? String
      fail "Please ensure task is a string value with contents" if task.empty?
      @task = task
      @mark_done_list = []
    end
  
    def task
      # Returns the task as a string
      return @task
    end
  
    def mark_done!
      # Marks the todo as done
      # Returns nothing
        @mark_done_list << @task
    end
  
    def done?
      # Returns true if the task is done
      # Otherwise, false
      if @mark_done_list.include?(@task)
        return true
      else
        return false
      end
        
    end
  end